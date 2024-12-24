import 'package:mis_lab_2/models/joke.dart';

class FavoritesService {
  static final List<Joke> favorites = [];

  static void toggleFavorite(Joke joke) {
    if (favorites.any((j) => j.id == joke.id)) {
      favorites.removeWhere((j) => j.id == joke.id);
    } else {
      favorites.add(joke);
    }
  }

  static bool isFavorite(Joke joke) {
    return favorites.any((j) => j.id == joke.id);
  }

  static List<Joke> getFavorites() {
    return favorites;
  }
}
