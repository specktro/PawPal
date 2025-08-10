import 'package:flutter/material.dart';
import 'package:pawpal/domain/entities/dog.dart';

// Presentation Layer - Dog Detail Screen
class DogDetailScreen extends StatelessWidget {
  final Dog dog;

  const DogDetailScreen({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  dog.profileImage,
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoCard(
              'Basic Information',
              [
                'Name: ${dog.name}',
                'Breed: ${dog.breed}',
                'Age: ${dog.age} years old',
                'Color: ${dog.color}',
                'Weight: ${dog.weight} kg',
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Owner Information',
              ['Owner: ${dog.ownerName}'],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Health Status',
              ['Status: ${dog.healthStatus}'],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Vaccinations',
              dog.vaccinations.map((v) => '• $v').toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<String> items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(item),
            )),
          ],
        ),
      ),
    );
  }
}