import 'dart:ui';

class Category {
  String id;
  String title;
  Color color;
  String imageName;


  Category(this.id, this.title, this.color, this.imageName);
  static List<Category> getAllCategories(){
    return[
      Category('sports', 'Sports', Color(0xFFC91C22), 'ball.png'),
      Category('general', 'General', Color(0xFF003E90), 'Politics.png'),
      Category('health', 'Health', Color(0xFFED1E79), 'health.png'),
      Category('business','Business', Color(0xFFCF7E48),'bussines.png'),
      Category('technology', 'Technology', Color(0xFF4882CF), 'environment.png'),
      Category('science', 'Science', Color(0xFFF2D352), 'science.png'),
    ];
  }
}
