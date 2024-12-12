import 'package:flutter/material.dart';

import '../models/joke.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;

  const JokeCard({super.key, required this.joke});

  @override
  JokeCardState createState() => JokeCardState();
}

class JokeCardState extends State<JokeCard> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Card(
            borderOnForeground: true,
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () => setState(() => show = !show),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.joke.setup,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (show) ...[
                      Text(
                        widget.joke.punchline,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 154, 16, 16),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
