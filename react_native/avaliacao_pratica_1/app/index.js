import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';
import { useRouter } from 'expo-router';

export default function HomeScreen() {
  const [nome, setNome] = useState('');
  const [avatarUrl, setAvatarUrl] = useState('');
  const router = useRouter();

  const irParaPerfil = () => {
    router.push({
      pathname: '/perfil',
      params: { nome: nome, avatar: avatarUrl },
    });
  };

  return (
    <View style={styles.container}>
      <Text style={styles.label}>Nome:</Text>
      <TextInput
        style={styles.input}
        placeholder="Digite seu nome"
        value={nome}
        onChangeText={setNome}
      />

      <Text style={styles.label}>URL do Avatar:</Text>
      <TextInput
        style={styles.input}
        placeholder="https://github.com/seu-usuario.png"
        value={avatarUrl}
        onChangeText={setAvatarUrl}
      />

      <Button title="Ir para o Perfil" onPress={irParaPerfil} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#f5f5f5',
  },
  label: {
    fontSize: 16,
    marginBottom: 5,
  },
  input: {
    width: '100%',
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 20,
    paddingHorizontal: 10,
    borderRadius: 5,
  },
});