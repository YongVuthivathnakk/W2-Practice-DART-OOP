import 'order_item.dart';
import 'item.dart';

class Order {
  int id;
  List<OrderItem> orderItems = [];

  Order(this.id);

  double calculateTotal() {
    double total = 0;
    for (var orderItem in orderItems) {
      total += orderItem.quantity * orderItem.item.price;
    }
    return total;
  }

  OrderItem addOrderItem(int id, Item item, int quantity) {
    for (var orderItem in orderItems) {
      if (orderItem.id == id) {
        throw ArgumentError("OrderItem with ID $id already exists in this order");
      }
    }
    final newOrderItem = OrderItem(id, item, quantity);
    orderItems.add(newOrderItem);
    return newOrderItem;
  }
}
