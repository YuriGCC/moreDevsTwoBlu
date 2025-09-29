import React, { useState, useRef } from 'react';
import { View, TextInput, Button, StyleSheet, Alert } from 'react-native';

const RedefinirSenhaScreen = ({ navigation }) => {
  const [senha, setSenha] = useState('');
  const [confirmarSenha, setConfirmarSenha] = useState('');
  const senhaInputRef = useRef(null);

  const handleRedefinir = () => {
    if (senha !== confirmarSenha) {
      Alert.alert('Erro', 'Senhas não são iguais', [
        { text: 'OK', onPress: () => senhaInputRef.current.focus() },
      ]);
      return;
    }

    if (!senha || !confirmarSenha) {
        Alert.alert('Erro', 'Preencha todos os campos');
        return;
    }

    // Lógica para salvar a nova senha (aqui apenas simulamos)
    Alert.alert('Sucesso', 'Senha redefinida com sucesso', [
      { text: 'OK', onPress: () => navigation.navigate('Login') },
    ]);
  };

  return (
    <View style={styles.container}>
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
      <Button
        title="Redefinir Senha"
        onPress={handleRedefinir}
      />
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
});

export default RedefinirSenhaScreen;