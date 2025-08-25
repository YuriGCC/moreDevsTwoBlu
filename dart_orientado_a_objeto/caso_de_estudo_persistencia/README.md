# Projeto Dart + MySQL (Cadastro e Consultas)

Este projeto é um protótipo simples em **Dart** conectado diretamente ao **MySQL** para:
- Cadastrar **Clientes**, **Pedidos** e **Produtos**
- Realizar duas consultas:
    1. **Listagem de pedidos com dados do cliente** (JOIN)
    2. **Resumo de pedidos por cliente com total gasto** (GROUP BY)

    
## Estrutura do Projeto

lib/
    core/
        client.dart # Classe Cliente
        order.dart # Classe Pedido
        product.dart # Classe Produto
    repositories/
        mysql_interface.dart # Conexão com MySQL
        report_repository.dart # Consultas (JOIN e GROUP BY)
    main.dart # Exemplo prático (inserção e consultas)

## Pré-requisitos

- Dart SDK instalado ([Instalar Dart](https://dart.dev/get-dart))
- MySQL Server instalado
- Biblioteca `mysql_client` para Dart:

```bash
  dart pub add mysql_client
```
  
## Configuração do Banco de Dados
No MySQL, execute o script mysql_setup.sql

## Funcionamento do Projeto

main.dart:

 - Cria produtos (pré-cadastrados)

 - Cria clientes e associa pedidos com produtos e quantidades

 - Salva os dados no MySQL

 - Executa as duas consultas exigidas

Consultas:

 - listOrdersWithClients() → Lista pedidos com cliente (JOIN)

 - listClientSummary() → Mostra quanto cada cliente gastou (GROUP BY)