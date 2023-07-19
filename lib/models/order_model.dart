import 'package:order_system_app/models/pizza_model.dart';

class Order {
  String orderId;
  String table; // table identifier
  bool hasStarter; // if there is a starter meal
  DateTime orderTime; // time when order was placed
  List<Pizza> pizzasList; // all pizzas present in the order
  // saladsList
  // nesto za hladna predjela

  Order({
    required this.orderId,
    required this.table,
    required this.orderTime,
    required this.pizzasList,
    this.hasStarter = false,
  });
}
