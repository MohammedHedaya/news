import 'package:flutter/material.dart';
import 'package:news/models/sourcesResponse/Source.dart';
import 'package:news/screens/TabWidget.dart';
import 'package:news/ui/home/news/newslistwidget.dart';

class SourcesTabsWidgets extends StatefulWidget {
  List<Source> sources;

  SourcesTabsWidgets(this.sources, {super.key});

  @override
  State<SourcesTabsWidgets> createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<SourcesTabsWidgets> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            isScrollable: true,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            tabs: widget.sources
                .map((source) => Tab(
                      child: TabWidget(
                          source, widget.sources.indexOf(source) == selectedIndex),
                    ))
                .toList(),
          ),
        ),
        Expanded(child: NewsListWidget(widget.sources[selectedIndex])),
      ],
    );
  }
}
