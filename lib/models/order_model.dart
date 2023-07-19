import 'package:order_system_app/models/pizza_model.dart';
import 'package:order_system_app/models/salad_model.dart';

class Order {
  String orderId;
  String table; // table identifier
  bool hasStarter; // if there is a starter meal
  DateTime orderTime; // time when order was placed
  List<Pizza> pizzasList; // all pizzas present in the order
  List<Salad> saladsList; // all salads present in th eorder
  // nesto za hladna predjela

  Order({
    required this.orderId,
    required this.table,
    required this.orderTime,
    required this.pizzasList,
    required this.saladsList,
    this.hasStarter = false,
  });
}
