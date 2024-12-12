import 'package:flutter/material.dart';
import 'package:mis_lab_2/services/api_services.dart';
import 'package:mis_lab_2/widgets/joke_card.dart';

class JokeListScreen extends StatelessWidget {
  final String type;
  final ApiService apiService = ApiService();

  JokeListScreen({super.key, required this.type});

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
        title: Text(
          '${type.toUpperCase()} Jokes',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
          future: apiService.getJokesByType(type),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final joke = snapshot.data![index];
                return JokeCard(joke: joke);
              },
            );
          }),
    );
  }
}
