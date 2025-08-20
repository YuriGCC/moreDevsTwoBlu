import 'dart:io';
import 'dart:convert';
import 'package:mysql_client/mysql_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

// --- Configuração de Conexão com Banco de Dados (copiado do banco01.dart) ---
const String _dbHost = '127.0.0.1';
const int _dbPort = 3306;
const String _dbUser = 'usuario';
const String _dbPassword = 'senha';
const String _dbDatabase = 'loja';

Future<MySQLConnection?> _connectToDatabase() async {
  try {
    final conn = await MySQLConnection.createConnection(
      host: _dbHost,
      port: _dbPort,
      userName: _dbUser,
      databaseName: _dbDatabase,
      password: _dbPassword,
      secure: false,
    );
    await conn.connect();
    return conn;
  } catch (erro) {
    print('Erro ao conectar ao banco de dados: $erro');
    return null;
  }
}

void main() async {
  final Router _router = Router();
  final int serverPort = 8083; // Mantemos 8083 conforme seu teste

  // --- Handler para a rota raiz (opcional) ---
  _router.get('/', (Request request) {
    return Response.ok('Bem-vindo à API da Biblioteca!');
  });

  // ------------------------------------------
  // --- Endpoints da API para Livros (CRUD) ---
  // ------------------------------------------

  // Endpoint para listar todos os livros (GET /livros)
  _router.get('/livros', (Request request) async {
    final conn = await _connectToDatabase();
    if (conn == null) {
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao conectar ao banco de dados.'}),
      );
    }
    try {
      var resultado = await conn.execute(
        'select idlivro,titulo,autor from livros order by idlivro',
      );

      if (resultado.rows.isEmpty) {
        return Response.ok(
          jsonEncode([]),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
        );
      }

      final List<Map<String, dynamic>> livros = [];
      for (var linha in resultado.rows) {
        livros.add({
          'id': linha.typedColByName<int>('idlivro'),
          'titulo': linha.typedColByName<String>('titulo'),
          'autor': linha.typedColByName<String>('autor'),
        });
      }
      return Response.ok(
        jsonEncode(livros),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    } catch (e) {
      print('Erro ao listar livros na API: $e');
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro interno ao listar livros.'}),
      );
    } finally {
      await conn.close();
    }
  });

  // Endpoint para incluir um novo livro (POST /livros)
  _router.post('/livros', (Request request) async {
    final conn = await _connectToDatabase();
    if (conn == null) {
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao conectar ao banco de dados.'}),
      );
    }
    try {
      final String content = await utf8.decodeStream(request.read());
      if (content.isEmpty) {
        return Response.badRequest(
          body: jsonEncode({'message': 'Corpo da requisição vazio.'}),
        );
      }
      final Map<String, dynamic> body = jsonDecode(content);

      final String? titulo = body['titulo'] as String?;
      final String? autor = body['autor'] as String?;

      if (titulo == null || autor == null || titulo.isEmpty || autor.isEmpty) {
        return Response.badRequest(
          body: jsonEncode({'message': 'Título e autor são obrigatórios.'}),
        );
      }

      var result = await conn.execute(
        'insert into livros (titulo,autor) values (:titulo,:autor)',
        {'titulo': titulo, 'autor': autor},
      );

      return Response(
        HttpStatus.created, // 200 Created
        body: jsonEncode({
          'message': 'Livro incluído com sucesso!',
          'id': result.lastInsertID.toInt(),
        }), // <-- AQUI: convertemos BigInt para int
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    } catch (e) {
      print('Erro ao incluir livro na API: $e');
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro interno ao incluir livro.'}),
      );
    } finally {
      await conn.close();
    }
  });

  // Endpoint para buscar livro por ID (GET /livros/{id})
  _router.get('/livros/<id>', (Request request, String id) async {
    final conn = await _connectToDatabase();
    if (conn == null) {
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao conectar ao banco de dados.'}),
      );
    }
    try {
      final int? livroId = int.tryParse(id);
      if (livroId == null) {
        return Response.badRequest(
          body: jsonEncode({'message': 'ID do livro inválido.'}),
        );
      }

      var resultado = await conn.execute(
        'select idlivro,titulo,autor from livros where idlivro = :id',
        {'id': livroId},
      );

      if (resultado.rows.isEmpty) {
        return Response.notFound(
          jsonEncode({'message': 'Livro não encontrado.'}),
        );
      }

      final linha = resultado.rows.first;
      final livro = {
        'id': linha.typedColByName<int>('idlivro'),
        'titulo': linha.typedColByName<String>('titulo'),
        'autor': linha.typedColByName<String>('autor'),
      };
      return Response.ok(
        jsonEncode(livro),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    } catch (e) {
      print('Erro ao buscar livro por ID na API: $e');
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro interno ao buscar livro.'}),
      );
    } finally {
      await conn.close();
    }
  });

  // Endpoint para atualizar um livro existente (PUT /livros/{id})
  _router.put('/livros/<id>', (Request request, String id) async {
    final conn = await _connectToDatabase();
    if (conn == null) {
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao conectar ao banco de dados.'}),
      );
    }
    try {
      final int? livroId = int.tryParse(id);
      if (livroId == null) {
        return Response.badRequest(
          body: jsonEncode({'message': 'ID do livro inválido.'}),
        );
      }

      final String content = await utf8.decodeStream(request.read());
      if (content.isEmpty) {
        return Response.badRequest(
          body: jsonEncode({'message': 'Corpo da requisição vazio.'}),
        );
      }
      final Map<String, dynamic> body = jsonDecode(content);

      final String? titulo = body['titulo'] as String?;
      final String? autor = body['autor'] as String?;

      if (titulo == null || autor == null || titulo.isEmpty || autor.isEmpty) {
        return Response.badRequest(
          body: jsonEncode({
            'message': 'Título e autor são obrigatórios para atualização.',
          }),
        );
      }

      var result = await conn.execute(
        'update livros set titulo = :titulo, autor = :autor where idlivro = :id',
        {'titulo': titulo, 'autor': autor, 'id': livroId},
      );

      if (result.affectedRows == 0) {
        return Response.notFound(
          jsonEncode({
            'message': 'Livro com ID $livroId não encontrado para atualização.',
          }),
        );
      }
      return Response.ok(
        jsonEncode({'message': 'Livro atualizado com sucesso!'}),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    } catch (e) {
      print('Erro ao atualizar livro na API: $e');
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro interno ao atualizar livro.'}),
      );
    } finally {
      await conn.close();
    }
  });

  // Endpoint para excluir um livro (DELETE /livros/{id})
  _router.delete('/livros/<id>', (Request request, String id) async {
    final conn = await _connectToDatabase();
    if (conn == null) {
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao conectar ao banco de dados.'}),
      );
    }
    try {
      final int? livroId = int.tryParse(id);
      if (livroId == null) {
        return Response.badRequest(
          body: jsonEncode({'message': 'ID do livro inválido.'}),
        );
      }

      var result = await conn.execute(
        'delete from livros where idlivro = :id',
        {'id': livroId},
      );

      if (result.affectedRows == 0) {
        return Response.notFound(
          jsonEncode({
            'message': 'Livro com ID $livroId não encontrado para exclusão.',
          }),
        );
      }
      return Response(
        HttpStatus.noContent,
      ); // 204 No Content for successful deletion without a body
    } catch (e) {
      print('Erro ao excluir livro na API: $e');
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro interno ao excluir livro.'}),
      );
    } finally {
      await conn.close();
    }
  });

  // Criar a pipeline de middlewares (logRequests para ver requisições no console)
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_router.call);

  // Iniciar o servidor HTTP
  try {
    final server = await shelf_io.serve(
      handler,
      InternetAddress.loopbackIPv4,
      serverPort,
    );
    print(
      'Servidor API ouvindo em http://${server.address.host}:${server.port}',
    );
  } on SocketException catch (e) {
    if (e.message.contains('permissões de acesso') ||
        e.osError?.errorCode == 10013 ||
        e.osError?.errorCode == 10048 ||
        e.message.contains('já está em uso') ||
        e.message.contains('Address already in use')) {
      print(
        '\n========================================================================',
      );
      print(
        'ERRO: A porta $serverPort já está em uso ou você não tem permissão para usá-la.',
      );
      print('Por favor, verifique se outro programa está utilizando a porta.');
      print('Você pode tentar:');
      print(
        '  1. Mudar a porta no código (ex: para 8081, 9000, etc.) e reiniciar o servidor.',
      );
      print('  2. Fechar o programa que está usando a porta $serverPort.');
      print(
        '========================================================================\n',
      );
    } else {
      print('Ocorreu um erro de rede inesperado ao iniciar o servidor: $e');
    }
  } catch (e) {
    print('Ocorreu um erro inesperado ao iniciar o servidor: $e');
  }
}
