import 'package:flutter/material.dart';
import 'package:resturant/Database/initDB.dart';
import '../Home/homeScreen/homeScreen.dart';
import '../Shop/shop.dart';

class Home extends StatefulWidget {
  final VoidCallback openDrawer;

  const Home({Key? key, required this.openDrawer}) : super(key: key);

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: buildBody(),
      resizeToAvoidBottomInset: false,
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

  Widget buildBody() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        bottomIndex = value;
        setState(() {});
      },
      children: [
        HomeScreen(
          openDrawer: widget.openDrawer,
        ),
        ShopScreen(
          openDrawer: widget.openDrawer,
        ),
        const Scaffold(),
        const Scaffold(),
      ],
    );
  }
}

class BottomSet {
  IconData? icon;
  String label;
  BottomSet({this.icon, required this.label});
}
