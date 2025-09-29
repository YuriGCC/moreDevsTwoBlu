import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import LoginScreen from './screens/login';
import CadastroScreen from './screens/cadastro';
import RedefinirSenhaScreen from './screens/redefinir_senha';

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Login">
        <Stack.Screen name="Login" component={LoginScreen} options={{ title: 'Bem-vindo' }} />
        <Stack.Screen name="Cadastro" component={CadastroScreen} options={{ title: 'Crie sua Conta' }} />
        <Stack.Screen name="RedefinirSenha" component={RedefinirSenhaScreen} options={{ title: 'Redefina sua Senha' }} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}