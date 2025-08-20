import '../../domain/models/dog.dart';
import '../../domain/repositories/dog_repository.dart';

class MockDogRepository implements DogRepository {
  static final List<Dog> _mockDogs = [
    Dog(
      id: '1',
      name: 'Buddy',
      breed: 'Golden Retriever',
      age: 3,
      color: 'Golden',
      weight: 28.5,
      ownerName: 'John Smith',
      profileImage: '🐕',
      lastVisit: DateTime.now().subtract(const Duration(days: 30)),
      vaccinations: ['Rabies', 'DHPP', 'Bordetella'],
      healthStatus: 'Healthy',
    ),
    Dog(
      id: '2',
      name: 'Luna',
      breed: 'Border Collie',
      age: 2,
      color: 'Black & White',
      weight: 22.0,
      ownerName: 'Sarah Johnson',
      profileImage: '🐶',
      lastVisit: DateTime.now().subtract(const Duration(days: 15)),
      vaccinations: ['Rabies', 'DHPP'],
      healthStatus: 'Healthy',
    ),
    Dog(
      id: '3',
      name: 'Max',
      breed: 'German Shepherd',
      age: 5,
      color: 'Brown & Black',
      weight: 35.0,
      ownerName: 'Mike Wilson',
      profileImage: '🦮',
      lastVisit: DateTime.now().subtract(const Duration(days: 7)),
      vaccinations: ['Rabies', 'DHPP', 'Bordetella', 'Lyme'],
      healthStatus: 'Under Treatment',
    ),
    Dog(
      id: '4',
      name: 'Bella',
      breed: 'Labrador',
      age: 4,
      color: 'Chocolate',
      weight: 26.8,
      ownerName: 'Emma Davis',
      profileImage: '🐕‍🦺',
      lastVisit: DateTime.now().subtract(const Duration(days: 45)),
      vaccinations: ['Rabies', 'DHPP'],
      healthStatus: 'Healthy',
    ),
    Dog(
      id: '5',
      name: 'Charlie',
      breed: 'Beagle',
      age: 6,
      color: 'Tricolor',
      weight: 18.2,
      ownerName: 'Robert Brown',
      profileImage: '🐕',
      lastVisit: DateTime.now().subtract(const Duration(days: 60)),
      vaccinations: ['Rabies', 'DHPP', 'Bordetella'],
      healthStatus: 'Needs Checkup',
    ),
    Dog(
      id: '6',
      name: 'Daisy',
      breed: 'Poodle',
      age: 1,
      color: 'White',
      weight: 15.5,
      ownerName: 'Lisa Garcia',
      profileImage: '🐩',
      lastVisit: DateTime.now().subtract(const Duration(days: 90)),
      vaccinations: ['Rabies'],
      healthStatus: 'Healthy',
    ),
    Dog(
      id: '7',
      name: 'Rocky',
      breed: 'Bulldog',
      age: 4,
      color: 'Brindle',
      weight: 30.2,
      ownerName: 'David Miller',
      profileImage: '🐶',
      lastVisit: DateTime.now().subtract(const Duration(days: 20)),
      vaccinations: ['Rabies', 'DHPP', 'Bordetella'],
      healthStatus: 'Healthy',
    ),
    Dog(
      id: '8',
      name: 'Milo',
      breed: 'Husky',
      age: 3,
      color: 'Grey & White',
      weight: 32.0,
      ownerName: 'Jennifer Lee',
      profileImage: '🐺',
      lastVisit: DateTime.now().subtract(const Duration(days: 10)),
      vaccinations: ['Rabies', 'DHPP', 'Bordetella', 'Lyme'],
      healthStatus: 'Healthy',
    ),
  ];

  @override
  Future<List<Dog>> getAllDogs() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_mockDogs);
  }

  @override
  Future<Dog?> getDogById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockDogs.firstWhere(
      (dog) => dog.id == id,
      orElse: () => throw Exception('Dog not found'),
    );
  }

  @override
  Future<List<Dog>> getDogsByOwner(String ownerName) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _mockDogs.where((dog) => 
      dog.ownerName.toLowerCase().contains(ownerName.toLowerCase())
    ).toList();
  }
}