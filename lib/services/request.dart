import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Request {
  final String apiUrl = 'www.omdbapi.com';

  /*
    Realiza as requisições da aplicação, é interessante caso a url precise ser alterada,
    dessa forma evitamos de ter que alterar em todas as partes do projeto.
  */

  Future<Response> searchMovie({
    String? endpoint,
    Object? body,
    Map<String, String>? header,
    Map<String, String>? queryParemeters,
  }) async {
    var url = Uri.http(apiUrl, endpoint ?? '', queryParemeters);
    return await http.get(url);
  }
}
