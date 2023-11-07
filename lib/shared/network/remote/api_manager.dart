import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/models/newsResponse/NewsResponse.dart';
import 'package:news/models/sourcesResponse/SourcesResponse.dart';
import '../../components/constants.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String categoryId) async {
    var uri = Uri.https(BASE_URL, "/v2/top-headlines/sources",
        {"category": categoryId, "apiKey": API_KEY});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String? sourceId) async{
    var url = Uri.https(
        BASE_URL, "/v2/everything",{
          "apiKey": API_KEY,
          "sources": sourceId
        });
    var response =await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse =NewsResponse.fromJson(json);
    return newsResponse;
  }
}
