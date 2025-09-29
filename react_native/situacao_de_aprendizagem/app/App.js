import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, Button, SafeAreaView } from 'react-native';
import axios from 'axios';

const API_URL = 'http://10.0.2.2:3000';

export default function App() {

  const incluirCliente = async () => {
    try {
      console.log('--- Incluindo Cliente ---');
      const response = await axios.post(`${API_URL}/clientes`, { nome: 'João da Silva' });
      console.log('Cliente incluído:', response.data);
    } catch (error) {
      console.error('Erro ao incluir cliente:', error.response ? error.response.data : error.message);
    }
  };

  const incluirPedido = async () => {
    try {
      console.log('--- Incluindo Pedido ---');
      const response = await axios.post(`${API_URL}/pedidos`, { produto: 'Notebook', valor: 4500.00, cliente_id: 1 });
      console.log('Pedido incluído:', response.data);
    } catch (error) {
      console.error('Erro ao incluir pedido:', error.response ? error.response.data : error.message);
    }
  };

  const consultarPedidosComClientes = async () => {
    try {
      console.log('--- Consulta 1: Pedidos com Clientes (JOIN) ---');
      const response = await axios.get(`${API_URL}/pedidos-com-clientes`);
      console.log('Resultado:', response.data);
    } catch (error) {
      console.error('Erro na consulta:', error.response ? error.response.data : error.message);
    }
  };

  const consultarResumoPorCliente = async () => {
    try {
      console.log('--- Consulta 2: Resumo por Cliente (GROUP BY) ---');
      const response = await axios.get(`${API_URL}/resumo-por-cliente`);
      console.log('Resultado:', response.data);
    } catch (error) {
      console.error('Erro na consulta:', error.response ? error.response.data : error.message);
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>Clientes e Pedidos</Text>
      <Text style={styles.subtitle}>Os resultados aparecerão no console do Metro.</Text>
      <View style={styles.buttonContainer}>
        <Button title="Incluir Cliente" onPress={incluirCliente} />
        <Button title="Incluir Pedido" onPress={incluirPedido} />
        <Button title="Consultar Pedidos (JOIN)" onPress={consultarPedidosComClientes} />
        <Button title="Consultar Resumo (GROUP BY)" onPress={consultarResumoPorCliente} />
      </View>
      <StatusBar style="auto" />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 20,
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  subtitle: {
    fontSize: 14,
    color: 'gray',
    marginBottom: 30,
    textAlign: 'center',
  },
  buttonContainer: {
    width: '80%',
    gap: 15,
  }
});