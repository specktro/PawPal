// Domain Layer - Entities
class Dog {
  final String id;
  final String name;
  final String breed;
  final int age;
  final String color;
  final double weight;
  final String ownerName;
  final String profileImage;
  final DateTime lastVisit;
  final List<String> vaccinations;
  final String healthStatus;

  const Dog({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.color,
    required this.weight,
    required this.ownerName,
    required this.profileImage,
    required this.lastVisit,
    required this.vaccinations,
    required this.healthStatus,
  });

  Dog copyWith({
    String? id,
    String? name,
    String? breed,
    int? age,
    String? color,
    double? weight,
    String? ownerName,
    String? profileImage,
    DateTime? lastVisit,
    List<String>? vaccinations,
    String? healthStatus,
  }) {
    return Dog(
      id: id ?? this.id,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      color: color ?? this.color,
      weight: weight ?? this.weight,
      ownerName: ownerName ?? this.ownerName,
      profileImage: profileImage ?? this.profileImage,
      lastVisit: lastVisit ?? this.lastVisit,
      vaccinations: vaccinations ?? this.vaccinations,
      healthStatus: healthStatus ?? this.healthStatus,
    );
  }
}