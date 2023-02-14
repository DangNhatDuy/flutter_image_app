# flutter_image_app

A Flutter App that displays a list of photos as a gallery. Users can tap the photo to see a full-screen view of it
with the possibility to zoom in and out.

## Installation 

- Clone the project

- Go to the project directory and run these commands in console to get the required dependencies:
```bash
  flutter pub get
  
  flutter run
```
- Enjoy!

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:

```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

## App Features:
- Use Unsplash Photo API to get a list of photos and build a gallery of photos
- The user can tap the photo and can see a full-screen view of the photo
- The user has an infinite scroll on the gallery screen
- User can bookmark their favourite photos
- User can view all bookmark photos in a viewer

## Tech Stack

**Client:** Flutter (Dart)

**Server:** 

**State Management:** GetX *(MVC model)*

### Libraries & Tools Used

- [getx](https://github.com/jonataslaw/getx) (State Management)

- [http](https://github.com/dart-lang/http)

- [shared_preferences](https://github.com/flutter/plugins/tree/main/packages/shared_preferences/shared_preferences)

### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- app/
    |- data/
        |- models/
        |- network/
    |- global_widgets/
    |- modules/
|- core/
    |- base_controller/
    |- helper/
    |- storage/
|- routes/
    |- pages.dart
    |- routes.dart
|- main.dart
|- injector.dart
```
