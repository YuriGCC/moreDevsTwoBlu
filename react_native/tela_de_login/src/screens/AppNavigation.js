import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import LoginScreen from '../screens/LoginScreen';
import CadastroScreen from '../screens/CadastroScreen';
import RedefinirSenhaScreen from '../screens/RedefinirSenhaScreen';

const Stack = createStackNavigator();

const AppNavigator = () => {
  return (
    <Stack.Navigator initialRouteName="Login">
      <Stack.Screen name="Login" component={LoginScreen} options={{ title: 'Login' }} />
      <Stack.Screen name="Cadastro" component={CadastroScreen} options={{ title: 'Cadastro de Usuário' }} />
      <Stack.Screen name="RedefinirSenha" component={RedefinirSenhaScreen} options={{ title: 'Redefinir Senha' }} />
    </Stack.Navigator>
  );
};

export default AppNavigator;