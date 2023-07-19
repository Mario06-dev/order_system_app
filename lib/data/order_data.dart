import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:order_system_app/models/order_model.dart';
import 'package:order_system_app/models/pizza_model.dart';

class OrderData extends ChangeNotifier {
  // contains list of all currently active orders
  final List<Order> _activeOrders = [
    Order(
      orderId: "fskjsflj2",
      table: "2",
      orderTime: DateTime.parse('2023-07-10 20:18:04Z'),
      pizzasList: [
        Pizza(name: "Margarita", toppings: ["salsa, mozzarella"]),
        Pizza(
          name: "Margarita",
          toppings: ["salsa, mozzarella"],
          isBabySize: true,
        ),
      ],
    ),
    Order(
      orderId: "salksdofi",
      table: "5",
      orderTime: DateTime.parse('2023-07-10 20:20:04Z'),
      pizzasList: [
        Pizza(
          name: "Capriciosa",
          toppings: ["salsa, mozzarella, gljive, kobasice, masline"],
        ),
        Pizza(
          name: "Capriciosa",
          toppings: ["salsa, mozzarella, gljive, kobasice, masline"],
          isBabySize: true,
        ),
        Pizza(
          name: "Capriciosa",
          toppings: ["salsa, mozzarella, gljive, kobasice, masline"],
        ),
      ],
    ),
    Order(
      orderId: "dsklmoifajr",
      table: "V",
      orderTime: DateTime.parse('2023-07-10 20:20:04Z'),
      pizzasList: [
        Pizza(name: "Učka", toppings: ["salsa, mozzarella, luk, pomidori"])
      ],
    ),
  ];

  // returns all active orders
  UnmodifiableListView<Order> get tasks {
    return UnmodifiableListView(_activeOrders);
  }

  // returns number of active orders
  int get activeOrdersCount {
    return _activeOrders.length;
  }

  // return number of both baby and normal pizzas in order
  Map getNumberOfPizzas(String orderId) {
    int numOfBaby = 0;
    int numOfNormal = 0;

    for (var i = 0; i <= _activeOrders.length; i++) {
      // order with id matched
      if (_activeOrders[i].orderId == orderId) {
        // loop through all pizzas in order pizzaList
        for (var pizzaIndex = 0;
            pizzaIndex <= _activeOrders[i].pizzasList.length;
            pizzaIndex++) {
          if (_activeOrders[i].pizzasList[pizzaIndex].isBabySize) {
            numOfBaby++;
          } else {
            numOfNormal++;
          }
        }
      }
    }
    return {'baby': numOfBaby, 'normal': numOfNormal};
  }

  // add new active order

  // delete active order
}