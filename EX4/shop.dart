import 'item.dart';
import 'order.dart';
import 'order_item.dart';

class Shop {
  final String name;
  List<Order> orders = [];
  List<Item> items = [];

  Shop(this.name);

  Item createItem(int id, String name, double price, ItemType type) {
    for (var item in items) {
      if (item.id == id) {
        throw ArgumentError("Item with ID $id already exists");
      }
    }
    final newItem = Item(id, name, price, type);
    items.add(newItem);
    return newItem;
  }

  Order addOrder(int orderId, int orderItemId, Item item, int quantity) {
    var existingOrders = orders.where((order) => order.id == orderId);
    if (existingOrders.isNotEmpty) {
      var existingOrder = existingOrders.first;
      existingOrder.addOrderItem(orderItemId, item, quantity);
      return existingOrder;
    } else {
      final newOrder = Order(orderId);
      newOrder.addOrderItem(orderItemId, item, quantity);
      orders.add(newOrder);
      return newOrder;
    }
  }

  void showAllOrders() {
    if (orders.isEmpty) {
      print("No orders found.");
      return;
    }

    for (var order in orders) {
      print("Order #${order.id}");
      print("--------------------");

      if (order.orderItems.isEmpty) {
        print("  (No items in this order)");
      } else {
        for (var orderItem in order.orderItems) {
          final item = orderItem.item;
          final subtotal = orderItem.quantity * item.price;
          print(
              "  ${item.name} (${item.type.name}) - \$${item.price.toStringAsFixed(2)} x ${orderItem.quantity} = \$${subtotal.toStringAsFixed(2)}");
        }
      }

      print("  --------------------");
      print("  Total: \$${order.calculateTotal().toStringAsFixed(2)}\n");
    }
  }

  @override
  String toString() {
    return "Shop: $name\n-----------------\nAvailable Items\n===========\n${items.map((item) => ("${item.name} - \$${item.price.toStringAsFixed(2)} (${item.type.name})")).join('\n')}";
  }
}
