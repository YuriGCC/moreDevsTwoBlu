import React from 'react';
import { View, Text, TextInput, Button, StyleSheet, Alert } from 'react-native';

export default function LoginScreen({ navigation }) {
  const handleLogin = () => {
    Alert.alert('Login', 'Em Breve!');
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Tela de Login</Text>
      <TextInput
        style={styles.input}
        placeholder="E-mail"
        keyboardType="email-address"
        autoCapitalize="none"
      />
      <TextInput
        style={styles.input}
        placeholder="Senha"
        secureTextEntry
      />
      <Button title="Entrar" onPress={handleLogin} />
      <View style={styles.buttonSpacing} />
      <Button
        title="Registrar-se"
        onPress={() => navigation.navigate('Cadastro')}
      />
      <View style={styles.buttonSpacing} />
      <Button
        title="Esqueci minha senha"
        onPress={() => navigation.navigate('RedefinirSenha')}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
    backgroundColor: '#f5f5f5',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 20,
  },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 12,
    paddingHorizontal: 8,
    borderRadius: 4,
  },
  buttonSpacing: {
    height: 10,
  }
});