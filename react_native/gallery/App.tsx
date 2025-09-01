import React, { useState } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import GalleryScreen from './src/screens/GalleryScreen';
import AddPhotoScreen from './src/screens/AddPhotoScreen';

export type RootStackParamList = {
  Gallery: undefined;
  AddPhoto: undefined;
};

const Stack = createNativeStackNavigator<RootStackParamList>();

export type Photo = {
  id: string;
  uri: string;
  caption: string;
};

export default function App() {
  const [photos, setPhotos] = useState<Photo[]>([]);

  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Gallery">
          {props => <GalleryScreen {...props} photos={photos} />}
        </Stack.Screen>
        <Stack.Screen name="AddPhoto">
          {props => <AddPhotoScreen {...props} setPhotos={setPhotos} photos={photos} />}
        </Stack.Screen>
      </Stack.Navigator>
    </NavigationContainer>
  );
}
