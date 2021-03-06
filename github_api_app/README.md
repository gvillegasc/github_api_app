## Getting Started for Flutter App

### Pre-requisites

For run this application you must install [Flutter](https://flutter.dev/) 2.0 or higher.

You can know how to install flutter [here](https://flutter.dev/docs/get-started/install)

### Installation

After to clone the repository open a console on the folder and move to the `github_api_app` folder

```bash
# move to the app project
cd github_api_app
```
Next download the `flutter` dependencies with:
```bash
# get dependencies
flutter pub get
```

### Usage

Next to download dependencies you have to have an android emulator or ios emulator switched on and execute the following command.

The mobile app has three environments development, staging and production

```bash
# run in development environment
flutter run --target lib/main_development.dart --flavor development
```
```bash
# run in staging environment
flutter run --target lib/main_staging.dart --flavor staging
```
```bash
# run in production environment
flutter run --target lib/main_production.dart --flavor production
```

NOTE** if you want run the app on the development environment is necessary start the nodejs api (`github_api`), you can see [here](https://github.com/gvillegasc/github_api_app#getting-started-for-nodejs-api) and put only your ip in the apiHost variable in the file `lib/main_development.dart`.

<img src="./readme-images/main_development.png" width="500"/>

### App images
<table>
    <tr>
        <th>App</th>
        <th>Commits Page Light</th>
    </tr>
	<tr>
        <td><img src="./readme-images/app.gif" alt="app" width="200"/></td>
        <td><img src="./readme-images/app-light-theme.jpeg" alt="app-light-theme" width="200"/></td>        
	</tr>
</table>

<table>
    <tr>
        <th>Commits Page Dark</th>
        <th>Detail Commit</th>
    </tr>
	<tr>
        <td><img src="./readme-images/app-dark-theme.jpeg" alt="app-dark-theme" width="200"/></td>
        <td><img src="./readme-images/commit-detail.jpeg" alt="detail-commit" width="200"/></td>
	</tr>
</table>

### Run unit test

To run the unit tests you must run the following command remember that to run the tests is necessary to install the dependencies

```bash
flutter test
```

## Builded with

- [Flutter](https://flutter.dev/) - SDK for develop

## Author

- **Gerardo Villegas** - [gvillegasc](https://github.com/gvillegasc)
