import 'package:flutter/material.dart';
import 'package:mis_lab_2/services/api_services.dart';
import 'package:mis_lab_2/widgets/joke_type_card.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 154, 16, 16),
          title: const Text(
            'Joke Types',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "/random_joke"),
              icon: const Icon(Icons.shuffle),
              color: Colors.white,
            )
          ],
        ),
        body: FutureBuilder<List<String>>(
            future: apiService.getJokesType(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No joke types available'));
              }

              return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 200, 16, 36),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return JokeTypeCard(type: snapshot.data![index]);
                  });
            }));
  }
}
