import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/dog_bloc.dart';
import '../theme/app_theme.dart';
import '../theme/theme_bloc.dart';
import '../widgets/dog_card.dart';

class DogListScreen extends StatelessWidget {
  const DogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('My Pets'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              final currentMode = context.read<ThemeBloc>().state.themeMode;
              final newMode = currentMode == AppThemeMode.dark 
                  ? AppThemeMode.light 
                  : AppThemeMode.dark;
              context.read<ThemeBloc>().add(ChangeThemeMode(newMode));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark 
              ? [AppTheme.darkBackground, AppTheme.darkSurface]
              : [AppTheme.lightBackground, AppTheme.lightSurface],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (query) {
                  context.read<DogBloc>().add(SearchDogs(query));
                },
                style: TextStyle(
                  color: isDark ? AppTheme.darkTextPrimary : AppTheme.lightTextPrimary,
                ),
                decoration: InputDecoration(
                  hintText: 'Search pets...',
                  hintStyle: TextStyle(
                    color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppTheme.primaryCoral,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<DogBloc, DogState>(
                builder: (context, state) {
                  if (state is DogLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primaryCoral,
                      ),
                    );
                  } else if (state is DogError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: isDark ? Colors.red[400] : Colors.red[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.message,
                            style: TextStyle(
                              color: isDark ? AppTheme.darkTextPrimary : AppTheme.lightTextPrimary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<DogBloc>().add(LoadDogs());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryCoral,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (state is DogLoaded) {
                    if (state.filteredDogs.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pets,
                              size: 64,
                              color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No pets found',
                              style: TextStyle(
                                fontSize: 18,
                                color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      itemCount: state.filteredDogs.length,
                      itemBuilder: (context, index) {
                        final dog = state.filteredDogs[index];
                        return DogCard(dog: dog);
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Welcome! Loading your pets...',
                        style: TextStyle(
                          color: isDark ? AppTheme.darkTextPrimary : AppTheme.lightTextPrimary,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppTheme.primaryCoral, AppTheme.primaryPeach],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryCoral.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Add pet feature coming soon!'),
                backgroundColor: AppTheme.primaryCoral,
              ),
            );
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}