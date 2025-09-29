import React, { useState, useEffect } from 'react';
import { View, TextInput, Button, StyleSheet, Alert } from 'react-native';

const CadastroScreen = ({ navigation }) => {
  const [cpf, setCpf] = useState('');
  const [nome, setNome] = useState('');
  const [email, setEmail] = useState('');
  const [senha, setSenha] = useState('');
  const [isFormValid, setIsFormValid] = useState(false);

  useEffect(() => {
    if (cpf && nome && email && senha) {
      setIsFormValid(true);
    } else {
      setIsFormValid(false);
    }
  }, [cpf, nome, email, senha]);

  const handleSalvar = () => {
    Alert.alert('Sucesso', 'Usuário registrado com sucesso', [
      { text: 'OK', onPress: () => navigation.navigate('Login') },
    ]);
  };

  return (
    <View style={styles.container}>
      <TextInput
        style={styles.input}
        placeholder="CPF"
        value={cpf}
        onChangeText={setCpf}
        keyboardType="numeric"
      />
      <TextInput
        style={styles.input}
        placeholder="Nome Completo"
        value={nome}
        onChangeText={setNome}
      />
      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        keyboardType="email-address"
        autoCapitalize="none"
      />
      <TextInput
        style={styles.input}
        placeholder="Senha"
        value={senha}
        onChangeText={setSenha}
        secureTextEntry
      />
      <View style={styles.buttonContainer}>
        <Button
          title="Salvar"
          onPress={handleSalvar}
          disabled={!isFormValid}
        />
        <View style={styles.spacer} />
        <Button
          title="Voltar para Login"
          onPress={() => navigation.navigate('Login')}
        />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 16,
  },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 12,
    paddingHorizontal: 8,
  },
  buttonContainer: {
    marginTop: 10,
  },
  spacer: {
    height: 10,
  }
});

export default CadastroScreen;