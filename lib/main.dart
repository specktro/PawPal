import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/mock_dog_repository.dart';
import 'presentation/blocs/dog_bloc.dart';
import 'presentation/screens/dog_detail_screen.dart';
import 'presentation/theme/app_theme.dart';
import 'presentation/theme/theme_bloc.dart';

void main() {
  runApp(const VetApp());
}

class VetApp extends StatelessWidget {
  const VetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
          create: (context) => DogBloc(repository: MockDogRepository())
            ..add(LoadDogs()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          // Listen to system theme changes
          final systemBrightness = MediaQuery.platformBrightnessOf(context);
          if (systemBrightness != themeState.systemBrightness) {
            context.read<ThemeBloc>().add(SystemThemeChanged(systemBrightness));
          }

          return MaterialApp(
            title: 'PawPal',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: _convertThemeMode(themeState.themeMode),
            home: const DogListScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }

  ThemeMode _convertThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}