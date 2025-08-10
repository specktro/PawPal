import 'package:pawpal/domain/entities/dog.dart';

// Domain Layer - Repository Interface
abstract class DogRepository {
  Future<List<Dog>> getAllDogs();
  Future<Dog?> getDogById(String id);
  Future<List<Dog>> getDogsByOwner(String ownerName);
}