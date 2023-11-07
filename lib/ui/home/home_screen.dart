import 'package:flutter/material.dart';
import 'package:news/ui/home/categories/CategoriesFields.dart';
import 'package:news/ui/home/categories/category.dart';
import 'package:news/ui/home/categoryDetails/category_details.dart';
import 'package:news/ui/home/home_drawer.dart';
import 'package:news/ui/home/settings/SettingsFields.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget=CategoriesFields(onCategoryClick);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        drawer: HomeDrawer(onMenuItemClick),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              )),
          title:const Text("News"),
        ),
        body:selectedWidget,
      ),
    );
  }

 late Widget selectedWidget ;

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
    switch (item){
      case MenuItem.categories: {
        selectedWidget=CategoriesFields(onCategoryClick);
      }
      case MenuItem.settings : {
        selectedWidget =SettingsFields();
      }
    }
    setState(() {

    });
  }
  void onCategoryClick(Category category){
    selectedWidget = CategoryDetails(category);
    setState(() {

    });
  }
}
