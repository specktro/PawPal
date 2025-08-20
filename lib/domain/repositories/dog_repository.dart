import '../models/dog.dart';

abstract class DogRepository {
  Future<List<Dog>> getAllDogs();
  Future<Dog?> getDogById(String id);
  Future<List<Dog>> getDogsByOwner(String ownerName);
}