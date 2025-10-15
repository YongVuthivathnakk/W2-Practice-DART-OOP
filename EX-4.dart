// Shop Management
enum ItemType {Fruit, Canned, Vegetable, Refreshment, Snack}

class Item {
  final int id;
  final String name;
  double _price;
  final ItemType type;


  set price(double value) {
    if(value < 0) {
      throw ArgumentError("Price shall always be greater or equalt to 0")
    }
    price = value;
  }


  Item(this.id, this.name, price, this.type) : _price = price;
}

class OrderItem {
  final int id;
  Item item;
  int quantity;


}