import 'package:flutter/material.dart';
import 'package:order_system_app/widgets/order_preview_card.dart';

import '../models/pizza_model.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              "Aktivne narudžbe",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 7,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: (100 / 80),
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return OrderPreviewCard(
                  table: "5",
                  numberOfPizzas: const {'baby': 2, 'normal': 2},
                  orderId: 'jshakjhsajk',
                  orderTime: DateTime.parse('2023-07-10 20:18:04Z'),
                  pizzasList: [
                    Pizza(name: "Margarita", toppings: ["salsa, mozzarella"]),
                    Pizza(
                      name: "Margarita",
                      toppings: ["salsa, mozzarella"],
                      isBabySize: true,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
