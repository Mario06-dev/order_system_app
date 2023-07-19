import 'package:flutter/material.dart';
import 'package:order_system_app/data/order_data.dart';
import 'package:order_system_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OrderData>(create: (_) => OrderData()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Order System App',
        home: MainScreen(),
      ),
    );
  }
}
