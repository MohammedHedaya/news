import 'package:flutter/material.dart';
import 'package:news/models/newsResponse/news.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class NewsListViewModel extends ChangeNotifier {
  bool? showLoading;
  List<News>? newsList;
  String? errorMessage;

  getNews(String sourceId) async {
    showLoading=true;
    newsList=null;
    errorMessage=null;
    notifyListeners();
    try {
      var response = await ApiManager.getNews(sourceId);

      showLoading=false;
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        newsList = response.articles;
      }
    }catch(e){
      showLoading=false;
      errorMessage=e.toString();
    }
    notifyListeners();
  }
}
