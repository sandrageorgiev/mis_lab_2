import 'package:flutter/material.dart';
import 'package:mis_lab_2/screens/favorites_screen.dart';
import 'package:mis_lab_2/services/api_services.dart';
import 'package:mis_lab_2/services/notification_service.dart';
import 'package:mis_lab_2/widgets/joke_type_card.dart';
import 'package:timezone/timezone.dart' as tz;

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  final NotificationService notificationService = NotificationService();

  HomeScreen({super.key}) {
    _scheduleNotification();
  }

  void _scheduleNotification() {
    // Schedule daily notification at 9:00 AM
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate =
        // tz.TZDateTime(tz.local, now.year, now.month, now.day, 9);
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 4, 25);

    if (scheduledDate.isBefore(now)) {
      scheduledDate.add(const Duration(days: 1));
    }

    final diff = scheduledDate.difference(now);
    notificationService.showNotification(
      0,
      'Daily Joke',
      'Open the app to see the joke of the day!',
      diff.inSeconds,
    );
  }

  // diff.inSeconds,

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
            ),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesScreen()),
              ),
              icon: const Icon(Icons.favorite),
              color: Colors.white,
            ),
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
