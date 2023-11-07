import 'package:flutter/material.dart';
import 'package:news/models/sourcesResponse/Source.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List<Source>? newsSourcesList;
  String? errorMessage;
  bool? showLoading;
  void getSources(String categoryId)async{
    showLoading=true;
    newsSourcesList=null;
    errorMessage=null;
    notifyListeners();
    try{
      var response = await ApiManager.getSources(categoryId);
      showLoading=null;
      if(response.status=='error'){
        errorMessage=response.message;
      }else{
        newsSourcesList=response.sources;
      }
    }
    catch(e){
      showLoading=null;
      errorMessage=e.toString();
    }
    notifyListeners();
  }
}