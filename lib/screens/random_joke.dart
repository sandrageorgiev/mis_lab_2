import 'package:flutter/material.dart';
import 'package:mis_lab_2/models/joke.dart';
import 'package:mis_lab_2/services/api_services.dart';
import 'package:mis_lab_2/widgets/joke_card.dart';

class RandomJokeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 154, 16, 16),
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            )),
        title: const Text(
          'Random Joke',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<Joke>(
          future: apiService.getRandomJoke(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: JokeCard(joke: snapshot.data!),
              ),
            );
          }),
    );
  }
}
