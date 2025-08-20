import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme.dart';

// Events
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeMode extends ThemeEvent {
  final AppThemeMode themeMode;

  const ChangeThemeMode(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

class SystemThemeChanged extends ThemeEvent {
  final Brightness systemBrightness;

  const SystemThemeChanged(this.systemBrightness);

  @override
  List<Object> get props => [systemBrightness];
}

// State
class ThemeState extends Equatable {
  final AppThemeMode themeMode;
  final Brightness systemBrightness;
  final bool isDarkMode;

  const ThemeState({
    required this.themeMode,
    required this.systemBrightness,
    required this.isDarkMode,
  });

  ThemeState copyWith({
    AppThemeMode? themeMode,
    Brightness? systemBrightness,
    bool? isDarkMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      systemBrightness: systemBrightness ?? this.systemBrightness,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  List<Object> get props => [themeMode, systemBrightness, isDarkMode];
}

// BLoC
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(
    themeMode: AppThemeMode.system,
    systemBrightness: Brightness.light,
    isDarkMode: false,
  )) {
    on<ChangeThemeMode>(_onChangeThemeMode);
    on<SystemThemeChanged>(_onSystemThemeChanged);
  }

  void _onChangeThemeMode(ChangeThemeMode event, Emitter<ThemeState> emit) {
    final isDark = _calculateIsDark(event.themeMode, state.systemBrightness);
    emit(state.copyWith(
      themeMode: event.themeMode,
      isDarkMode: isDark,
    ));
  }

  void _onSystemThemeChanged(SystemThemeChanged event, Emitter<ThemeState> emit) {
    final isDark = _calculateIsDark(state.themeMode, event.systemBrightness);
    emit(state.copyWith(
      systemBrightness: event.systemBrightness,
      isDarkMode: isDark,
    ));
  }

  bool _calculateIsDark(AppThemeMode themeMode, Brightness systemBrightness) {
    switch (themeMode) {
      case AppThemeMode.light:
        return false;
      case AppThemeMode.dark:
        return true;
      case AppThemeMode.system:
        return systemBrightness == Brightness.dark;
    }
  }
}