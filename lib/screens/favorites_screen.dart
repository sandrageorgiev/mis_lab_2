import 'package:flutter/material.dart';
import 'package:mis_lab_2/services/favourites_service.dart';
import 'package:mis_lab_2/widgets/joke_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesService.favorites;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 154, 16, 16),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: const Text(
          'Favorite Jokes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text('No favorite jokes yet.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final joke = favorites[index];
                return JokeCard(joke: joke);
              },
            ),
    );
  }
}
