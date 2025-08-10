import 'package:equatable/equatable.dart';
import 'package:pawpal/domain/entities/dog.dart';

// BLoC Layer - States
abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object?> get props => [];
}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
  final List<Dog> dogs;
  final List<Dog> filteredDogs;
  final String searchQuery;
  final Dog? selectedDog;

  const DogLoaded({
    required this.dogs,
    required this.filteredDogs,
    this.searchQuery = '',
    this.selectedDog,
  });

  DogLoaded copyWith({
    List<Dog>? dogs,
    List<Dog>? filteredDogs,
    String? searchQuery,
    Dog? selectedDog,
  }) {
    return DogLoaded(
      dogs: dogs ?? this.dogs,
      filteredDogs: filteredDogs ?? this.filteredDogs,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedDog: selectedDog ?? this.selectedDog,
    );
  }

  @override
  List<Object?> get props => [dogs, filteredDogs, searchQuery, selectedDog];
}

class DogError extends DogState {
  final String message;

  const DogError(this.message);

  @override
  List<Object> get props => [message];
}