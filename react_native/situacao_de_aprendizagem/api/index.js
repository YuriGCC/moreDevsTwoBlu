const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());


const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'senai_devs'
};


app.post('/clientes', async (req, res) => {
    try {
        const { nome } = req.body;
        const connection = await mysql.createConnection(dbConfig);
        const [result] = await connection.execute('INSERT INTO Cliente (nome) VALUES (?)', [nome]);
        await connection.end();
        res.status(201).json({ id: result.insertId, nome });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.post('/pedidos', async (req, res) => {
    try {
        const { produto, valor, cliente_id } = req.body;
        const connection = await mysql.createConnection(dbConfig);
        const [result] = await connection.execute(
            'INSERT INTO Pedido (produto, valor, cliente_id) VALUES (?, ?, ?)',
            [produto, valor, cliente_id]
        );
        await connection.end();
        res.status(201).json({ id: result.insertId, produto, valor, cliente_id });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.get('/pedidos-com-clientes', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbConfig);
        const [rows] = await connection.execute(`
            SELECT 
                p.id AS pedido_id,
                p.produto,
                p.valor,
                c.nome AS cliente_nome
            FROM Pedido p
            JOIN Cliente c ON p.cliente_id = c.id
        `);
        await connection.end();
        res.status(200).json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});


app.get('/resumo-por-cliente', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbConfig);
        const [rows] = await connection.execute(`
            SELECT 
                c.nome AS cliente_nome,
                COUNT(p.id) AS total_pedidos,
                SUM(p.valor) AS total_gasto
            FROM Cliente c
            JOIN Pedido p ON c.id = p.cliente_id
            GROUP BY c.nome
        `);
        await connection.end();
        res.status(200).json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});