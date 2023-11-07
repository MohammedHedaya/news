import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/sourcesResponse/Source.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class CategoryCubitViewModel extends Cubit<CategoryDetailsState>{
  CategoryCubitViewModel():super(LoadingState('Loading...'));
  
  void loadSources(String categoryId)async{
    emit(LoadingState('Loading...'));
    try{
      var response = await ApiManager.getSources(categoryId);
      if(response.status=='error'){
        emit(ErrorState(response.message??""));
      }else{
        emit(SuccessState(response.sources));
      }
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }
}
sealed class CategoryDetailsState{}
class SuccessState extends CategoryDetailsState{
  List<Source>? sourcesList;
  SuccessState(this.sourcesList);
}
class LoadingState extends CategoryDetailsState{
  String message;
  LoadingState(this.message);
}
class ErrorState extends CategoryDetailsState{
  String errorMessage;
  ErrorState(this.errorMessage);
}