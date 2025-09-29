# Projeto: Cadastro e Consulta com React Native + MySQL

Este é um protótipo simples para registro e consulta de clientes e pedidos, utilizando React Native para o front-end e Node.js com Express para a API de back-end.

## Estrutura do Projeto

- `/api`: Contém o código do servidor back-end em Node.js.
- `/app`: Contém o código do aplicativo front-end em React Native (Expo).
- `database.sql`: Script para criação das tabelas no MySQL.

## Passos para Instalação e Execução

### 1. Configuração do Banco de Dados

1.  Rodar MySQL Server.
2.  Crie um banco de dados chamado `senai_devs`.
3.  Execute o script `database.sql` para criar as tabelas `Cliente` e `Pedido`.

### 2. Configuração do Back-end (API)

1.  Navegue até a pasta `api` através do terminal:
    ```bash
    cd api
    ```
2.  Edite o arquivo `index.js` e configure suas credenciais do MySQL na variável `dbConfig`.
3.  Acesse a pasta app e api Instale as dependências:
    ```bash
    npm install
    ```
4.  Inicie o servidor da API:
    ```bash
    npm run dev
    ```
    O servidor estará rodando em `http://localhost:3000`.

### 3. Configuração do Front-end (Aplicativo)

1.  Abra outro terminal e navegue até a pasta `app`:
    ```bash
    cd app
    ```
2.  Instale as dependências:
    ```bash
    npm install
    npm install axios
    ```
3.  **Importante:** No arquivo `App.js`, ajuste a variável `API_URL`.
    - Se for rodar no **emulador Android**, use `http://10.0.2.2:3000`.
    - Se for rodar no **emulador iOS**, use `http://localhost:3000`.
4.  Inicie o aplicativo:
    ```bash
    npx expo start
    ```

## Como Usar

1.  Com o back-end e o front-end rodando, abra o aplicativo no seu emulador ou dispositivo.
2.  Clique nos botões para executar as ações de inclusão e consulta.
3.  Observe o console do Metro (o terminal onde você rodou `npx expo start`) para ver os resultados das operações.