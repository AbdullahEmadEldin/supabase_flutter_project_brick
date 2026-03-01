# supabase_flutter_project_brick

A Mason brick that scaffolds a complete Flutter project with Supabase integration.

## Features

- **Supabase** integration with comprehensive error handling
- **BLoC / HydratedBloc** state management
- **GoRouter** for navigation
- **get_it** for dependency injection
- **dartz** Either-based async error resolution
- **easy_localization** with English & Arabic support
- **Custom theme system** with light/dark mode (AppColors & AppTextStyles extensions)
- **SharedPreferences** caching helper
- **Auth module** with login, register, and profile fetching

## Usage

```bash
mason make supabase_flutter_project_brick --project_name my_app
```

After generating:

1. Update `.env` with your Supabase credentials
2. Run `flutter pub get`
3. Run `flutter run`

## Variables

| Variable       | Description                          | Default  | Type     |
| -------------- | ------------------------------------ | -------- | -------- |
| `project_name` | The project name in snake_case       | `my_app` | `string` |

## Output

```
├── .env
├── .env.dev
├── .gitignore
├── analysis_options.yaml
├── pubspec.yaml
├── assets/
│   ├── fonts/
│   ├── icons/
│   ├── pngs/
│   └── translations/
├── lib/
│   ├── main.dart
│   ├── app_entry.dart
│   ├── core/
│   │   ├── constants/
│   │   ├── di/
│   │   ├── helpers/
│   │   ├── networking/
│   │   ├── router/
│   │   ├── services/
│   │   ├── theme/
│   │   └── ui/
│   └── modules/
│       └── auth/
└── test/
```
