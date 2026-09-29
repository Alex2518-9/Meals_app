# Meals

A Flutter recipe app for browsing meals by category, checking ingredients and cooking steps, saving favorites, and filtering recipes by dietary preferences.

## Features

- Browse recipes across categories such as Italian, Quick & Easy, Breakfast, and Asian.
- View each meal's ingredients, preparation steps, cooking time, complexity, and affordability.
- Add and remove meals from the Favorites tab.
- Filter the available meals by gluten-free, lactose-free, vegetarian, and vegan options.
- Navigate between categories and favorites with the bottom navigation bar.

The app currently uses a built-in sample recipe collection; it does not fetch or save recipes to a backend. Favorites and filter selections are kept in app state and reset when the app restarts. Meal photos are loaded from remote URLs, so an internet connection is needed to display them.

## Requirements

- Flutter SDK **3.9.0 or later** (Dart SDK constraint: `^3.9.0`)
- A configured Flutter target device or emulator

Flutter supports running this project on the platforms enabled in the repository: Android, iOS, web, macOS, Linux, and Windows. Some targets require their platform-specific development tools; see the [Flutter installation guide](https://docs.flutter.dev/get-started/install).

## Run locally

Clone the repository and enter the project directory:

```bash
git clone https://github.com/Alex2518-9/Meals_app.git
cd Meals_app
```

Fetch dependencies and start the app on a connected device or emulator:

```bash
flutter pub get
flutter run
```

To choose a particular target, list available devices with `flutter devices`, then run `flutter run -d <device-id>`.

## Run tests

```bash
flutter test
```

## Project structure

```text
lib/
  data/       Sample categories and meals
  models/     Category and meal models
  providers/  Riverpod providers for meals, filters, and favorites
  screens/    Category, meal, details, filters, and tab screens
  widgets/    Reusable meal, category, and navigation widgets
test/         Flutter widget tests
```

## Built with

- [Flutter](https://flutter.dev/)
- [Riverpod](https://riverpod.dev/) for app state
- [Google Fonts](https://pub.dev/packages/google_fonts) for typography
