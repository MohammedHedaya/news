import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/newsResponse/news.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class NewsViewModel extends Cubit<NewsListState> {
  NewsViewModel():super(LoadingState('Loading...'));

  void loadNews(String? sourceId)async{
    emit(LoadingState('Loading....'));
    try{
      var response = await ApiManager.getNews(sourceId);
      if(response.status=='error'){
        emit(ErrorState(response.message??""));
      }else{
        emit(SuccessState(response.articles));
      }
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class NewsListState {}

class SuccessState extends NewsListState {
  List<News>? newsList;

  SuccessState(this.newsList);
}

class ErrorState extends NewsListState {
  String message;

  ErrorState(this.message);
}

class LoadingState extends NewsListState {
  String message;

  LoadingState(this.message);
}