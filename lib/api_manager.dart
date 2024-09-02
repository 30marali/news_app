import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/SourceResponse.dart';

class ApiManager {
// https://newsapi.org/v2/top-headlines/sources?apiKey=2a52d78427824a4586540a19607ab271

  Future<SourceResponse> getSources() async {
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/top-headlines/sources",
      {"apiKey": "2a52d78427824a4586540a19607ab271"},
    );

    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(jsonFormat);
    return sourceResponse;
  }
}
