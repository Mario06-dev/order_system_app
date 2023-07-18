import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_system_app/screens/admin_screen.dart';
import 'package:order_system_app/screens/orders_screen.dart';
import 'package:order_system_app/screens/settings_screen.dart';
import 'package:order_system_app/screens/statistics_screen.dart';

import 'add_new_order_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewOrderScreen()),
          );
        },
      ),
      body: SafeArea(
        child: Row(
          children: [
            AppSideNavMenu(sideMenu: sideMenu),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  OrdersScreen(),
                  StatisticsScreen(),
                  SettingsScreen(),
                  AdminScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppSideNavMenu extends StatelessWidget {
  const AppSideNavMenu({
    super.key,
    required this.sideMenu,
  });

  final SideMenuController sideMenu;

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      style: SideMenuStyle(
        selectedColor: const Color(0xfff5f5f5),
        selectedTitleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        itemHeight: 70,
        itemInnerSpacing: 18.0,
      ),
      controller: sideMenu,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/icons/main.svg",
              height: 70,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Order System App",
              ),
            ),
            const Divider(
              indent: 8.0,
              endIndent: 8.0,
            )
          ],
        ),
      ),
      items: [
        SideMenuItem(
          priority: 0,
          title: "Narudžbe",
          icon: const Icon(Icons.dashboard),
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
        ),
        SideMenuItem(
          priority: 1,
          title: "Statistika",
          icon: const Icon(Icons.bar_chart),
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
        ),
        SideMenuItem(
          priority: 2,
          title: "Postavke",
          icon: const Icon(Icons.settings),
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
        ),
      ],
      footer: SideMenuItem(
        priority: 3,
        title: "Administrator",
        icon: const Icon(Icons.admin_panel_settings),
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
      ),
    );
  }
}
