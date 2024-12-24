import 'package:flutter/material.dart';
import 'package:mis_lab_2/services/favourites_service.dart';

import '../models/joke.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;

  const JokeCard({super.key, required this.joke});

  @override
  JokeCardState createState() => JokeCardState();
}

class JokeCardState extends State<JokeCard> {
  bool show = false;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = FavoritesService.isFavorite(widget.joke);
  }

  void _toggleFavorite() {
    setState(() {
      FavoritesService.toggleFavorite(widget.joke);
      isFavorite = FavoritesService.isFavorite(widget.joke);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          borderOnForeground: true,
          elevation: 5,
          margin: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            onTap: () => setState(() => show = !show),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        widget.joke.setup,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : null,
                        ),
                        onPressed: _toggleFavorite,
                      ),
                    ],
                  ),
                  if (show) ...[
                    const SizedBox(height: 8),
                    Text(
                      widget.joke.punchline,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 154, 16, 16),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
