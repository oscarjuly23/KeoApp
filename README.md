# KeoApp 🎤📱
Swift App about this artist.
La aplicación Kidd Keo App está diseñada para brindar información detallada sobre el reconocido artista musical español, Kidd Keo. A través de diversas pantallas y funcionalidades, los usuarios podrán explorar datos sobre el artista, sus canciones más populares, e incluso personalizar su experiencia.

## Pantallas y Funcionalidades:
### Pantalla de Carga Inicial:
- Presenta una imagen inicial de carga mientras se prepara la aplicación.
###Pantalla de Inicio de Sesión y Registro:
- Implementa pantallas de inicio de sesión y registro utilizando Firebase para gestionar la autenticación.
### Menú Inferior (Barra de Navegación):

#### HOME:
- Muestra información y la biografía principal del artista.
- Incluye un ImageView que presenta imágenes adicionales cuando se toca.
#### SONGS:
- Lista las canciones del artista, con la capacidad de eliminar o agregar nuevas.
- Redirige a una pantalla con la letra de la canción al hacer clic en el nombre (ScrollView).
- Los datos se obtienen de una API externa y se almacenan localmente en caché cada 5 minutos (GET).
#### PROFILE:
- Permite a los usuarios actualizar su información, como el nombre de usuario y una breve descripción.
- Funcionalidades adicionales incluyen cambiar el tamaño o color de la letra en la pantalla de letras de cada canción.
####CONTACT:
- Muestra enlaces a las redes sociales del artista, información de contacto y un mapa de la ubicación de la tienda física ficticia.

## Detalles Adicionales:
- Notificaciones para informar a los usuarios sobre el éxito o fracaso de las peticiones de agregar y eliminar.
- Switch para alternar entre el modo normal y el modo oscuro, al menos en la pantalla de letras.
- Posible implementación de una CheckBox en el perfil del usuario con funcionalidad por determinar.

## Objetos Swift:
#### Usuario:
- name: String
- password: String
- birthDate: Date
#### Canción:
- title: String
- album: String
- date: Date
- lyrics: String
## API:
- Propia
### Peticiones:
- Obtener información de la canción
- Agregar o actualizar información de la canción
- Eliminar información de la canción

##
@author: Oscar Julian - Bernat Segura  
@date: Enero 2022
