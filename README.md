# strikingCrowds - Habitus

*Habitus* es una aplicación diseñada para ayudar a los usuarios a gestionar sus eventos y hábitos diarios de manera eficiente. Ofrece una interfaz intuitiva y varias características útiles para mejorar la productividad y el equilibrio entre el trabajo y el ocio.

## Características

- **Login Page**: Los usuarios pueden iniciar sesión con una cuenta existente o registrarse usando una cuenta de Google.
- **Home Page**: Al ingresar, los usuarios son recibidos con una frase motivacional que cambia diariamente, tomada de una base de datos con más de 1500 frases. La página también envía notificaciones push si hay eventos programados para el día.
- **Calendario**: Los usuarios pueden ver todos los eventos que han creado. El botón "Create event" redirige a la pestaña para crear nuevos eventos.
- **Event Creator**: Permite a los usuarios crear eventos proporcionando toda la información necesaria. La aplicación verifica que todos los campos estén completos y correctos antes de permitir la creación del evento.
- **Event Stats**: Muestra estadísticas importantes sobre los eventos creados por el usuario, como la cantidad de eventos en cada categoría. Ayuda a los usuarios a analizar y encontrar un equilibrio entre diferentes áreas de su vida, como hobbies y trabajo.
- **Events Editor**: Permite a los usuarios realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) con eventos, excepto la creación de nuevos eventos (que se realiza en la pestaña de Event Creator). Los usuarios pueden buscar eventos por atributos, actualizar información y eliminar eventos. Las ediciones están restringidas a categorías predeterminadas para evitar inconsistencias.

## Instalación

Para instalar *Habitus*, sigue estos pasos:

1. Descarga el archivo `.zip` desde [enlace a la descarga] (si corresponde).
2. Descomprime el archivo en tu directorio de trabajo.
3. Ejecuta el script de instalación `install.sql` para configurar la base de datos.

   ```bash
   mysql -u [usuario] -p [nombre_base_datos] < install.sql
