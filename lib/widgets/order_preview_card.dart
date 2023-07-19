import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:order_system_app/models/pizza_model.dart';
import 'package:order_system_app/models/salad_model.dart';

import '../constants/colors.dart';

class OrderPreviewCard extends StatelessWidget {
  const OrderPreviewCard({
    super.key,
    required this.table,
    required this.numberOfPizzas,
    required this.orderTime,
    required this.orderId,
    required this.pizzasList,
    required this.saladsList,
  });

  final String table;
  final Map numberOfPizzas;
  final DateTime orderTime;
  final String orderId;
  final List<Pizza> pizzasList;
  final List<Salad> saladsList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xfff5f5f5),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Stol broj",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      table,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/salad.svg",
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(saladsList.length.toString()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/pizza.svg",
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                        "${numberOfPizzas['normal'] + numberOfPizzas['baby']}: ${numberOfPizzas['normal']}N i ${numberOfPizzas['baby']}B"),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  const Spacer(),
                  Text(DateFormat.Hm().format(orderTime)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
