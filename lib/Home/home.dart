import 'package:flutter/material.dart';
import '../Home/homeScreen/homeScreen.dart';
import '../Shop/shop.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  int bottomIndex = 0;
  List<BottomSet> bottomSet = [
    BottomSet(
      label: 'Home',
      icon: Icons.home,
    ),
    BottomSet(
      label: 'Shop',
      icon: Icons.shopify,
    ),
    BottomSet(
      label: 'Bookmark',
      icon: Icons.bookmark,
    ),
    BottomSet(label: 'Notify', icon: Icons.notifications),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          bottomIndex = value;
          setState(() {});
        },
        children: const [
          HomeScreen(),
          ShopScreen(),
          Scaffold(),
          Scaffold(),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontFamily: 'ubi',
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.amber[50],
          indicatorColor: Colors.amber[100],
          height: 60,
        ),
        child: NavigationBar(
          onDestinationSelected: (value) {
            bottomIndex = value;

            pageController.jumpToPage(value);
            setState(() {});
          },
          selectedIndex: bottomIndex,

          /* unselectedLabelStyle: TextStyle(
            fontFamily: 'ubi',
            color: Colors.black,
          ),
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            fontFamily: 'ubi',
            color: Colors.black,
          ), */
          destinations: bottomSet
              .map(
                (e) => NavigationDestination(
                  icon: Icon(
                    e.icon,
                  ),
                  label: e.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class BottomSet {
  IconData? icon;
  String label;
  BottomSet({this.icon, required this.label});
}
