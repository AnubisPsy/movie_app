import 'dart:convert';
import "package:http/http.dart" as http;

void main() {
  getMoviesData();
}

Future<void> getMoviesData() async {
  final apiKey = '677bfd67cff2735e2ea221a05eddd9f9';
  final apiUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    if (data['results'] != null) {
      final movies = data['results'] as List<dynamic>;
      for (var movie in movies) {
        final title = movie['title'];
        final overview = movie['overview'];
        print('Título: $title');
        print('Resumen: $overview');
        print('---');
      }
    } else {
      print('NO_RESULTADOS');
    }
  } else {
    print('ERROR DE OBTENCION DE DATOS: ${response.statusCode}');
  }
}
