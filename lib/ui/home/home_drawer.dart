import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
typedef OnMenuItemClick = void Function(MenuItem clickedItemPos);
class HomeDrawer extends StatelessWidget {


  OnMenuItemClick onMenuItemClick;
  HomeDrawer(this.onMenuItemClick,{super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: Text(
                "News App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                onMenuItemClick(MenuItem.categories);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 32,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Gap(12),
            InkWell(
              onTap: (){
                onMenuItemClick(MenuItem.settings);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 32,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


enum MenuItem{

  categories,
  settings,
}
