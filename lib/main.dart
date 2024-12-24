import 'package:flutter/material.dart';
import 'package:mis_lab_2/screens/home_screen.dart';
import 'package:mis_lab_2/screens/random_joke.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:mis_lab_2/services/notification_service.dart';
import 'firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().initNotification();
  tz.initializeTimeZones();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mis_lab_2',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/random_joke": (context) => RandomJokeScreen(),
      },
    );
  }
}
