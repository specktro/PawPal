import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpal/data/repositories/mock_dog_repository.dart';
import 'package:pawpal/presentation/blocs/dog_blocs.dart';
import 'package:pawpal/presentation/blocs/dog_events.dart';
import 'package:pawpal/presentation/screens/dog_list_screen.dart';

void main() {
  runApp(const VetApp());
}

class VetApp extends StatelessWidget {
  const VetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Care App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => DogBloc(repository: MockDogRepository())..add(LoadDogs()),
        child: const DogListScreen(),
      ),
    );
  }
}