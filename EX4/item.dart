enum ItemType { Fruit, Canned, Vegetable, Refreshment, Snack }

class Item {
  final int id;
  final String name;
  final ItemType type;
  double _price = 0;

  // Getter
  double get price => _price;

  // Setter
  set price(double value) {
    if (value < 0) {
      throw ArgumentError("Price must be greater or equal to 0");
    }
    _price = value;
  }

  // Constructor
  Item(this.id, this.name, double price, this.type) {
    if (price < 0) {
      throw ArgumentError("Price must be greater or equal to 0");
    }
    _price = price;
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, type: $type, price: $_price)';
  }
}
