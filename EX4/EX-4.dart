import 'shop.dart';
import 'item.dart';

void main() {
  Shop myShop = Shop("Nakk's Shop");

  // Create items
  Item item1 = myShop.createItem(1, "Orange", 2.4, ItemType.Fruit);
  Item item2 = myShop.createItem(2, "Tuna", 1.5, ItemType.Canned);
  Item item3 = myShop.createItem(3, "Banana", 1.5, ItemType.Fruit);
  Item item4 = myShop.createItem(4, "Carrot", 1.5, ItemType.Vegetable);

  // Add orders
  myShop.addOrder(1, 1, item1, 5);
  myShop.addOrder(1, 2, item2, 8);
  myShop.addOrder(2, 1, item3, 3);
  myShop.addOrder(2, 2, item4, 2);

  // Show all orders
  myShop.showAllOrders();
}
