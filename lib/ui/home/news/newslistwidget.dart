import 'package:flutter/material.dart';
import 'package:news/models/sourcesResponse/Source.dart';
import 'package:news/ui/home/news/NewsListViewModel.dart';
import 'package:news/ui/home/news/NewsWidget.dart';
import 'package:provider/provider.dart';

class NewsListWidget extends StatefulWidget {
  final Source source;
  NewsListWidget(this.source,{Key? key}) : super(key: key);

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = NewsListViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getNews(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.showLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel.errorMessage ?? ""),
                  ElevatedButton(onPressed: () {
                    viewModel.getNews(widget.source.id??"");
                  }, child: const Text('Try Again'))
                ],
              ),
            );
          }
          var newsList = viewModel.newsList;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsWidget(newsList![index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        },
      ),
    );
    // return FutureBuilder<NewsResponse>(
    //   future: ApiManager.getNews(source.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError || snapshot.data?.status == 'error') {
    //       return Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = snapshot.data?.articles;
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsWidget(newsList![index]);
    //       },
    //       itemCount: newsList?.length ?? 0,
    //     );
    //   },
    // );
  }
}
