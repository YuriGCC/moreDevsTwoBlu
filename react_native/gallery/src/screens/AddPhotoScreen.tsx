import React, { useEffect, useState } from 'react';
import * as ImagePicker from 'expo-image-picker';
import { View, TextInput, Button, StyleSheet, Image } from 'react-native';
import { NativeStackNavigationProp } from '@react-navigation/native-stack';
import { RootStackParamList, Photo } from '../../App';

type AddPhotoScreenProps = {
  navigation: NativeStackNavigationProp<RootStackParamList, 'AddPhoto'>;
  photos: Photo[];
  setPhotos: React.Dispatch<React.SetStateAction<Photo[]>>;
};


export default function AddPhotoScreen({ navigation, photos, setPhotos }: AddPhotoScreenProps) {
  const [uri, setUri] = useState('');
  const [caption, setCaption] = useState('');

  useEffect(() => {
    (async () => {
      const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
      if (status !== 'granted') {
        alert('Permissão necessária para selecionar imagens!');
      }
    })();
  }, []);

  const pickImage = async () => {
    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      quality: 1,
    });

    if (!result.canceled) {
      setUri(result.assets[0].uri); // salva a URI da imagem selecionada
    }
  };

  const handleAddPhoto = () => {
    if (!uri) return;

    const newPhoto: Photo = {
      id: Date.now().toString(),
      uri,
      caption,
    };

    setPhotos([...photos, newPhoto]); // adiciona a nova foto
    navigation.goBack(); // volta para a GallerryScreen
  };

  const addCoffeeImage = () => {
    const coffeeUri: string = 'https://coffee.alexflipnote.dev/random';
    const newPhoto: Photo = {
      id: Date.now().toString(),
      uri: coffeeUri,
      caption: 'Imagem que contém Café',
    };

    setPhotos([...photos, newPhoto]); // adiciona a nova foto
    navigation.goBack(); // volta para a GalleryScreen
  }

  return (
    <View style={styles.container}>
      <TextInput
        placeholder="URL da imagem"
        value={uri}
        onChangeText={setUri}
        style={styles.input}
      />
      <Button title="Escolher do dispositivo" onPress={pickImage} />
      {uri ? <Image source={{ uri }} style={styles.preview} /> : null}
      <TextInput
        placeholder="Legenda"
        value={caption}
        onChangeText={setCaption}
        style={styles.input}
      />
      <Button title="Adicionar Foto" onPress={handleAddPhoto} />
      <Button title="Adicionar Foto de um Café" onPress={addCoffeeImage} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16 },
  input: { borderWidth: 1, borderColor: '#ccc', padding: 10, marginBottom: 16, borderRadius: 8 },
  preview: { width: 200, height: 200, marginBottom: 16, borderRadius: 8, alignSelf: 'center' },
});
