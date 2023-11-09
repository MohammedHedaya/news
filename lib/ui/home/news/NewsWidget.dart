// news_widget.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/newsResponse/news.dart';
import 'package:news/screens/details_screen.dart';

class NewsWidget extends StatelessWidget {
  final News news;

  NewsWidget(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: news,
              );
            },
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Text(
            news.author ?? "",
            textAlign: TextAlign.start,
          ),
          Text(
            news.title ?? "",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          Text(
            news.publishedAt ?? "",
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:news/models/newsResponse/news.dart';
// import 'package:news/screens/details_screen.dart';
//
// class NewsWidget extends StatelessWidget {
//   News news;
//
//   NewsWidget(this.news, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           InkWell(
//             onTap: (){
//               Navigator.pushNamed(context, DetailsScreen.routeName,arguments:news);
//             },
//             child: ClipRRect(
//               child: CachedNetworkImage(
//                 imageUrl: news.urlToImage ?? "",
//                 height: 220,
//                 width: double.infinity,
//                 fit: BoxFit.fill,
//                 progressIndicatorBuilder: (context, url, downloadProgress) =>
//                     Center(
//                         child: CircularProgressIndicator(
//                             value: downloadProgress.progress)),
//                 errorWidget: (context, url, error) => Icon(Icons.error),
//               ),
//             ),
//           ),
//           Text(
//             news.author ?? "",
//             textAlign: TextAlign.start,
//           ),
//           Text(
//             news.title ?? "",
//             textAlign: TextAlign.start,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
//           ),
//           Text(
//             news.publishedAt ?? "",
//             textAlign: TextAlign.end,
//           ),
//         ],
//       ),
//     );
//   }
// }
