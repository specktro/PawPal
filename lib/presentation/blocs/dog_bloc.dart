import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/dog.dart';
import '../../domain/repositories/dog_repository.dart';

// Events
abstract class DogEvent extends Equatable {
  const DogEvent();

  @override
  List<Object> get props => [];
}

class LoadDogs extends DogEvent {}

class SearchDogs extends DogEvent {
  final String query;

  const SearchDogs(this.query);

  @override
  List<Object> get props => [query];
}

class SelectDog extends DogEvent {
  final String dogId;

  const SelectDog(this.dogId);

  @override
  List<Object> get props => [dogId];
}

// States
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

// BLoC
class DogBloc extends Bloc<DogEvent, DogState> {
  final DogRepository repository;

  DogBloc({required this.repository}) : super(DogInitial()) {
    on<LoadDogs>(_onLoadDogs);
    on<SearchDogs>(_onSearchDogs);
    on<SelectDog>(_onSelectDog);
  }

  Future<void> _onLoadDogs(LoadDogs event, Emitter<DogState> emit) async {
    emit(DogLoading());
    try {
      final dogs = await repository.getAllDogs();
      emit(DogLoaded(
        dogs: dogs,
        filteredDogs: dogs,
      ));
    } catch (e) {
      emit(DogError('Failed to load dogs: ${e.toString()}'));
    }
  }

  Future<void> _onSearchDogs(SearchDogs event, Emitter<DogState> emit) async {
    if (state is DogLoaded) {
      final currentState = state as DogLoaded;
      final filteredDogs = event.query.isEmpty
          ? currentState.dogs
          : currentState.dogs
              .where((dog) =>
                  dog.name.toLowerCase().contains(event.query.toLowerCase()) ||
                  dog.breed.toLowerCase().contains(event.query.toLowerCase()) ||
                  dog.ownerName.toLowerCase().contains(event.query.toLowerCase()))
              .toList();

      emit(currentState.copyWith(
        filteredDogs: filteredDogs,
        searchQuery: event.query,
      ));
    }
  }

  Future<void> _onSelectDog(SelectDog event, Emitter<DogState> emit) async {
    if (state is DogLoaded) {
      final currentState = state as DogLoaded;
      try {
        final selectedDog = await repository.getDogById(event.dogId);
        emit(currentState.copyWith(selectedDog: selectedDog));
      } catch (e) {
        emit(DogError('Failed to load dog details: ${e.toString()}'));
      }
    }
  }
}