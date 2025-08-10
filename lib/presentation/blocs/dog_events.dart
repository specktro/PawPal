// BLoC Layer - Events
import 'package:equatable/equatable.dart';

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