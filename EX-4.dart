// Shop Management

enum ItemType { Fruit, Canned, Vegetable, Refreshment, Snack }

// Item
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
      throw ArgumentError("Price shall always be greater or equalt to 0");
    }
    _price = value;
  }

  // Constructor
  Item(this.id, this.name, double price, this.type) {
    if (price < 0) {
      throw ArgumentError("Price shall always be greater or equalt to 0");
    }
    _price = price;
  }


  @override
  String toString() {
    return 'Item(id: $id, name: $name, type: $type, price: $_price)';
  }
}

// OrderItem
class OrderItem {
  final int id;
  Item item;
  int _quantity = 0;

  // Getter

  int get quantity => _quantity;

  // Setter
  set quantity(int value) {
    if (value < 0) {
      throw ArgumentError("Quantity shall always be greater or equalt to 0");
    }
    ;
    _quantity = value;
  }

  // Constructor
  OrderItem(this.id, this.item, int quantity) {
    if (quantity < 0) {
      throw ArgumentError("Price shall always be greater or equalt to 0");
    }
    _quantity = quantity;
  }
}

class Order {
  int id;
  List<OrderItem> orderItems = [];

  // Method
  double calculateTotal(List<OrderItem> orderItems) {
    double total = 0;
    for (var orderItem in orderItems) {
      total += (orderItem.quantity * orderItem.item.price);
    }
    return total;
  }

  OrderItem addOrderItem(int id, Item item, int quantity) {
    for (var orderItem in orderItems) {
      if (orderItem.id == id) {
        throw ArgumentError("Order with ID $id is already exist");
      }
    }

    if (quantity < 0) {
      throw ArgumentError("Quantity shall always be greater or equalt to 0");
    }

    OrderItem newOrderItem = OrderItem(id, item, quantity);
    orderItems.add(newOrderItem);
    return newOrderItem;
  }

  // Constructor
  Order(this.id);
}

// Shop
class Shop {
  final String name;
  List<Order> orders = [];
  List<Item> items = [];

  // Constructor
  Shop(this.name);

  // Method

  Order addOrder(int orderId, int orderItemId, Item item, int quantity) {
    // Find existing order
    var existingOrders = orders.where((order) => order.id == orderId);

    if (existingOrders.isNotEmpty) {
      // Add item to the existing order
      var existingOrder = existingOrders.first;
      existingOrder.addOrderItem(orderItemId, item, quantity);
      return existingOrder;
    } else {
      // Create a new order
      Order newOrder = Order(orderId);
      newOrder.addOrderItem(orderItemId, item, quantity);
      orders.add(newOrder);
      return newOrder;
    }
  }



  Item createItem(int id, String name, double price, ItemType type) {
    for (var item in items) {
      if (item.id == id) {
        throw ArgumentError("Order with ID $id is already exist");
      }
    }
    Item newItem = Item(id, name, price, type);
    items.add(newItem);
    return newItem;
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
    print(
        "  Total: \$${order.calculateTotal(order.orderItems).toStringAsFixed(2)}\n");
  }
}

  @override
  String toString() {
    return "Shop: $name\n-----------------\nAvialable Items\n===========\n${items.map((item) => ("${item.name} - \$${item.price.toStringAsFixed(2)} (${item.type.name})")).join('\n')}";
  }
}

void main() {
  Shop myShop = Shop("Nakk's Shop");



  // Create items
  Item item1 = myShop.createItem(1, "Orange", 2.4, ItemType.Fruit);
  Item item2 = myShop.createItem(2, "Tuna", 1.5, ItemType.Canned);
  Item item3 = myShop.createItem(3, "Banana", 1.5, ItemType.Fruit);
  Item item4 = myShop.createItem(4, "Carrot", 1.5, ItemType.Vegetable);

  // Show the avialable items
  // print(myShop);


  // Add items to orders
  myShop.addOrder(1, 1, item1, 5); // Order 1, item 1
  myShop.addOrder(1, 2, item2, 8); // Order 1, item 2
  myShop.addOrder(2, 1, item3, 3); // Order 2, item 1
  myShop.addOrder(2, 2, item4, 2); // Order 2, item 2
  myShop.addOrder(3, 1, item1, 4); // Order 3, item 1

  // Show all orders
  myShop.showAllOrders();
}

