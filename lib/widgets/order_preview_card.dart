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
            const SizedBox(height: 20),
            saladsList.isNotEmpty
                ? ItemLine(
                    lineText: saladsList.length.toString(),
                    lineIconSrc: 'assets/icons/salad.svg',
                  )
                : const SizedBox(),
            const SizedBox(height: 10),
            pizzasList.isNotEmpty
                ? ItemLine(
                    lineText:
                        '${numberOfPizzas['normal'] + numberOfPizzas['baby']}: ${numberOfPizzas['normal']}N i ${numberOfPizzas['baby']}B',
                    lineIconSrc: 'assets/icons/pizza.svg',
                  )
                : const SizedBox(),
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

class ItemLine extends StatelessWidget {
  const ItemLine({
    super.key,
    required this.lineText,
    required this.lineIconSrc,
  });

  final String lineText;
  final String lineIconSrc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          lineIconSrc,
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(lineText),
        ),
      ],
    );
  }
}
