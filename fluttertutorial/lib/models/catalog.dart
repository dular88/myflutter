class CatalogModel {
  static final items = [Item(title: 'My Title', id: 0, price: 100)];
}

class Item {
  final String title;
  final int id;
  final num price;

  Item({this.title = '', this.id = 1, this.price = 0.00});
}
