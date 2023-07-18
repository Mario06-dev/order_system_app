import 'package:flutter/material.dart';
import 'package:order_system_app/screens/main_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Order System App',
      home: MainScreen(),
    );
  }
}
