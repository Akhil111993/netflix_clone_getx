import 'api_key.dart';

const kBaseUrl = 'https://api.themoviedb.org/3';
const kImageAppendUrl = 'https://image.tmdb.org/t/p/w500';

class ApiEndPoints {
  static const downloads = '$kBaseUrl/trending/all/day?api_key=$kApiKey';
  static const weeklyTrending = '$kBaseUrl/trending/all/week?api_key=$kApiKey';
  static const trending =
      '$kBaseUrl/movie/popular?api_key=$kApiKey&language=en-US&page=1';
  static const comingSoon =
      '$kBaseUrl/movie/upcoming?api_key=$kApiKey&language=en-US&page=1';

  static const topRated =
      '$kBaseUrl/movie/top_rated?api_key=$kApiKey&language=en-US&page=1';

  static const popular =
      '$kBaseUrl/movie/popular?api_key=$kApiKey&language=en-US&page=1';

  static const latest =
      '$kBaseUrl/movie/latest?api_key=$kApiKey&language=en-US';

  static String getSearch(String query) {
    return '$kBaseUrl/search/movie?api_key=$kApiKey&language=en-US&query=$query&page=1&include_adult=false';
  }
}
