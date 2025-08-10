import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpal/presentation/blocs/dog_blocs.dart';
import 'package:pawpal/presentation/blocs/dog_events.dart';
import 'package:pawpal/presentation/blocs/dog_states.dart';
import 'package:pawpal/presentation/screens/dog_card.dart';


// Presentation Layer - Dog List Screen
class DogListScreen extends StatelessWidget {
  const DogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (query) {
                context.read<DogBloc>().add(SearchDogs(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search pets...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<DogBloc, DogState>(
              builder: (context, state) {
                if (state is DogLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DogError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, size: 64, color: Colors.red[300]),
                        const SizedBox(height: 16),
                        Text(state.message),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<DogBloc>().add(LoadDogs());
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                } else if (state is DogLoaded) {
                  if (state.filteredDogs.isEmpty) {
                    return const Center(
                      child: Text('No pets found'),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.filteredDogs.length,
                    itemBuilder: (context, index) {
                      final dog = state.filteredDogs[index];
                      return DogCard(dog: dog);
                    },
                  );
                } else {
                  return const Center(child: Text('Welcome! Loading your pets...'));
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add pet screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add pet feature coming soon!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}