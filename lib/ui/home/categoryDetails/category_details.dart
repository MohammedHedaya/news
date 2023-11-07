import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/SourcesTabsWidgets.dart';
import 'package:news/ui/home/categories/category.dart';
import 'package:news/ui/home/categoryDetails/CategoriesCubitViewModel.dart';

class CategoryDetails extends StatefulWidget {
   Category category;

  CategoryDetails(this.category,{super. key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryCubitViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubitViewModel, CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var sourcesList = state.sourcesList;
              return SourcesTabsWidgets(sourcesList!);
            }
          case LoadingState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.message),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.loadSources(widget.category.id);
                      },
                      child: Text("Try Again"),
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
