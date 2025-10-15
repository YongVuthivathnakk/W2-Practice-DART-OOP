import 'item.dart';

class OrderItem {
  final int id;
  Item item;
  int _quantity = 0;

  int get quantity => _quantity;

  set quantity(int value) {
    if (value < 0) {
      throw ArgumentError("Quantity must be greater or equal to 0");
    }
    _quantity = value;
  }

  OrderItem(this.id, this.item, int quantity) {
    if (quantity < 0) {
      throw ArgumentError("Quantity must be greater or equal to 0");
    }
    _quantity = quantity;
  }
}
