import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfinder_app/feature/home/presentaion/cubit/cat_cubit.dart';

import '../../data/model/beard_model.dart';

class PetListSection extends StatelessWidget {
  PetListSection({super.key});

  final List<Pet> pets = [
    Pet(
      name: 'Joli',
      gender: 'Female',
      age: '5 Months Old',
      distance: '1.6 km away',
      imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba',
    ),
    Pet(
      name: 'Tom',
      gender: 'Male',
      age: '1 year Old',
      distance: '2.7 km away',
      imageUrl: 'https://images.unsplash.com/photo-1543466835-00a7907e9de1',
    ),
    Pet(
      name: 'Oliver',
      gender: 'Male & Female',
      age: '3 Months Old',
      distance: '2 km away',
      imageUrl: 'https://images.unsplash.com/photo-1552728089-57bdde30beb3',
    ),
    Pet(
      name: 'Shelly',
      gender: 'Female',
      age: '15 year Old',
      distance: '3 km away',
      imageUrl: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        if (state is GetBreadLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetBreadFailure) {
          return Center(child: Text(state.message));
        }
        if (state is GetBreadSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: pets.length,
            itemBuilder: (context, index) {
              return PetCard(pet: state.breads[index]);
            },
          );
        }
        return Container();
      },
    );
  }
}

// Pet Card Widget
class PetCard extends StatelessWidget {
  final Cat pet;

  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://cdn2.thecatapi.com/images/${pet.referenceImageId}.jpg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.pets),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  pet.temperament ?? '',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  pet.lifeSpan ?? '',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(
                      pet.origin ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.teal),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class Pet {
  final String name;
  final String gender;
  final String age;
  final String distance;
  final String imageUrl;

  Pet({
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
    required this.imageUrl,
  });
}
