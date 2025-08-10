import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpal/domain/entities/dog.dart';
import 'package:pawpal/presentation/blocs/dog_blocs.dart';
import 'package:pawpal/presentation/blocs/dog_events.dart';
import 'package:pawpal/presentation/screens/dog_detail_screen.dart';

// Presentation Layer - Dog Card Widget
class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({super.key, required this.dog});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'healthy':
        return Colors.green;
      case 'under treatment':
        return Colors.orange;
      case 'needs checkup':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatLastVisit(DateTime lastVisit) {
    final now = DateTime.now();
    final difference = now.difference(lastVisit).inDays;
    
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return '1 day ago';
    } else if (difference < 30) {
      return '$difference days ago';
    } else if (difference < 365) {
      final months = (difference / 30).round();
      return months == 1 ? '1 month ago' : '$months months ago';
    } else {
      final years = (difference / 365).round();
      return years == 1 ? '1 year ago' : '$years years ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(
            dog.profileImage,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        title: Text(
          dog.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${dog.breed} • ${dog.age} years old'),
            Text('Owner: ${dog.ownerName}'),
            Text('Last visit: ${_formatLastVisit(dog.lastVisit)}'),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _getStatusColor(dog.healthStatus).withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _getStatusColor(dog.healthStatus)),
          ),
          child: Text(
            dog.healthStatus,
            style: TextStyle(
              color: _getStatusColor(dog.healthStatus),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
          final dogBloc = context.read<DogBloc>();
          dogBloc.add(SelectDog(dog.id));
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: dogBloc,
                child: DogDetailScreen(dog: dog),
              ),
            ),
          );
        },
      ),
    );
  }
}