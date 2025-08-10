import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpal/presentation/blocs/dog_events.dart';
import 'package:pawpal/presentation/blocs/dog_states.dart';
import 'package:pawpal/domain/repositories/dog_repository.dart';

// BLoC Layer - BLoC
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