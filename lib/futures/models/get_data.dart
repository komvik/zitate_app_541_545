import 'package:http/http.dart' as http;

Future<String> getData() async {
  final Uri uri = Uri.https('api.api-ninjas.com', '/v1/quotes');
  final http.Response response = await http.get(uri,
      headers: {'x-api-key': 'N3GBHnowDETYID/byVicqQ==Pzz67MSAYJwayc9Z'});
  if (response.statusCode == 200) {
    return response.body;
  }
  return "Fehler";
}
