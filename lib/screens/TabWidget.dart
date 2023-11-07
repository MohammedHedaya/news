import 'package:flutter/material.dart';
import 'package:news/models/sourcesResponse/Source.dart';


class TabWidget extends StatelessWidget {
  Source source;
  bool selected;

  TabWidget(this.source, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green),
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: selected ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
