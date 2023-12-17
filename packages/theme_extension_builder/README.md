# Theme Extension Builder

Theme extension builder (`theme_extension_builder`) package generages `ThemeExtension` boilerplate code.

This package depends on `theme_extension` annotation package and requires `build_runner` as dev dependency.

## Features

- Generate boilerplate code for your theme extension.
- Generate optional extensions to easly and conveniently access generated themes in your code.

## Getting started

- Add this dependency to your project into `dependencies` section of `pubspec.yaml`.
- Assume package located in `projectroot/packages/theme_extension` folder.

```yaml
dependencies:
  theme_extension:
    path: packages/theme_extension
    # git: github_repo_path
```

- Add this dependency to your project into `dev_dependencies` section of `pubspec.yaml`.
- Assume package located in `projectroot/packages/theme_extension_builder` folder.

```yaml
dev_dependencies:
  build_runner: <resolveable-version>
  theme_extension_builder:
    path: packages/theme_extension_builder
    # git: github_repo_path
```

- Then run `flutter pub get`.

- Create new file on project root called: `build.yaml` and add this code:
- Assume your `AppColors` class is located in: `lib/theme/app_colors.dart`

```yaml
targets:
  $default:
    builders:
      theme_extension_builder|theme_extension_builder:
        generate_for:
          - lib/theme/app_colors.dart
        # - more source files here...
```

## Usage

For usage example see: [ThemeExtension](../theme_extension/README.md#usage)

## Additional information

- The package is specifically designed to meet this project `Portfolio` needs.
- This package not published on pub.dev or distributed anywhere else.
- Code licensed under MIL License.
