import React from 'react';
import { View, FlatList, Image, Text, StyleSheet, TouchableOpacity, SafeAreaView  } from 'react-native';
import { NativeStackNavigationProp } from '@react-navigation/native-stack';
import { RootStackParamList, Photo } from '../../App';

type GalleryScreenProps = {
  navigation: NativeStackNavigationProp<RootStackParamList, 'Gallery'>;
  photos: Photo[];
};

export default function GalleryScreen({ navigation, photos }: GalleryScreenProps) {
  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <FlatList
          data={photos}
          keyExtractor={item => item.id}
          renderItem={({ item }) => (
            <View style={styles.card}>
              <Image source={{ uri: item.uri }} style={styles.image} />
              <Text style={styles.caption}>{item.caption}</Text>
            </View>
          )}
          contentContainerStyle={{ paddingBottom: 80 }}
        />

        <TouchableOpacity
          style={styles.button}
          onPress={() => navigation.navigate('AddPhoto')}
        >
          <Text style={styles.buttonText}>+ Adicionar Foto</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 10 },
  card: { marginBottom: 15, alignItems: 'center' },
  image: { width: 200, height: 200, borderRadius: 10 },
  caption: { marginTop: 5, fontSize: 16 },
  button: {
    position: 'absolute',
    bottom: 60,
    right: 20,
    backgroundColor: '#007BFF',
    paddingVertical: 12,
    paddingHorizontal: 20,
    borderRadius: 30,
    alignItems: 'center',
  },
  buttonText: { color: '#fff', fontWeight: 'bold', fontSize: 16 },
});
