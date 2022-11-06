class Item {
  final String title;

  Item({required this.title});
  Item.fromMap(Map map) : title = map['title'] as String;
  Map toMap() {
    return {title: title};
  }
}
