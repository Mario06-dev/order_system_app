import 'package:flutter/material.dart';
import 'package:order_system_app/data/order_data.dart';
import 'package:order_system_app/widgets/order_preview_card.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderData orderData = Provider.of<OrderData>(context);

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
              itemCount: orderData.activeOrdersCount,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: (100 / 80),
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return OrderPreviewCard(
                  table: orderData.orders[index].table,
                  numberOfPizzas: orderData
                      .getNumberOfPizzas(orderData.orders[index].orderId),
                  orderId: orderData.orders[index].orderId,
                  orderTime: orderData.orders[index].orderTime,
                  saladsList: orderData.orders[index].saladsList,
                  pizzasList: orderData.orders[index].pizzasList,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
