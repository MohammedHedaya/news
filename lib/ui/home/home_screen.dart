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
  bool search = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesFields(onCategoryClick);
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
        appBar: !search
            ? AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      search = !search;
                      setState(() {

                      });
                    },
                    icon: Icon(Icons.search_rounded),
                  ),
                ],
                backgroundColor: Colors.green,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                title: const Text("News"),
              )
            : AppBar(
                toolbarHeight: 70,
                centerTitle: true,
                title: TextField(
                  controller: searchController,
                  onChanged: (value){
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    prefixIconColor: Colors.green,
                    suffixIconColor: Colors.green,
                    focusColor: Colors.green,
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    hintText: 'Search',
                    prefixIcon: IconButton(onPressed: (){
                      searchController.clear();
                      search=!search;
                      setState(() {});
                    }, icon: Icon(Icons.close),),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
          backgroundColor: Colors.green,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
              ),
        body: selectedWidget,
      ),
    );
  }

  late Widget selectedWidget;

  void onMenuItemClick(MenuItem item) {
    Navigator.pop(context);
    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoriesFields(onCategoryClick);
        }
      case MenuItem.settings:
        {
          selectedWidget = SettingsFields();
        }
    }
    setState(() {});
  }

  void onCategoryClick(Category category) {
    selectedWidget = CategoryDetails(category);
    setState(() {});
  }
}
