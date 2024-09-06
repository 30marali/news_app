import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/NewsData.dart';
import 'package:news_app/SourceResponse.dart';

class ApiManager {
// https://newsapi.org/v2/top-headlines/sources?apiKey=2a52d78427824a4586540a19607ab271

  static Future<SourceResponse> getSources(String id) async {
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/top-headlines/sources",
      {
        "apiKey": "2a52d78427824a4586540a19607ab271",
        "category": id,
      },
    );

    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(jsonFormat);
    return sourceResponse;
  }

// https://newsapi.org/v2/everything?q=bitcoin&apiKey=2a52d78427824a4586540a19607ab271

  static Future<NewsDataResponse> getNewsData(String sourceId) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "2a52d78427824a4586540a19607ab271",
      "sources": sourceId,
    });
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);
    return newsDataResponse;
  }
}
