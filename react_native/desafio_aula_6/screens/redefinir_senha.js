import React, { useState, useRef } from 'react';
import { View, Text, TextInput, Button, StyleSheet, Alert } from 'react-native';

export default function RedefinirSenhaScreen({ navigation }) {
  const [senha, setSenha] = useState('');
  const [confirmarSenha, setConfirmarSenha] = useState('');
  const senhaInputRef = useRef(null);

  const handleRedefinir = () => {
    if (senha !== confirmarSenha) {
      Alert.alert('Erro', 'Senhas não são iguais');
      senhaInputRef.current.focus();
      return;
    }

    Alert.alert('Sucesso', 'Senha redefinida com sucesso', [
      { text: 'OK', onPress: () => navigation.goBack() }
    ]);
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Redefinição de Senha</Text>
      <TextInput
        ref={senhaInputRef}
        style={styles.input}
        placeholder="Nova Senha"
        value={senha}
        onChangeText={setSenha}
        secureTextEntry
      />
      <TextInput
        style={styles.input}
        placeholder="Confirmar Nova Senha"
        value={confirmarSenha}
        onChangeText={setConfirmarSenha}
        secureTextEntry
      />
      <Button title="Redefinir Senha" onPress={handleRedefinir} />
       <View style={styles.buttonSpacing} />
      <Button title="Voltar para Login" onPress={() => navigation.goBack()} />
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