import 'package:flutter/material.dart';

import '../Home/home.dart';

class DrawerBuild extends StatefulWidget {
  const DrawerBuild({Key? key}) : super(key: key);

  @override
  State<DrawerBuild> createState() => _DrawerBuildState();
}

class _DrawerBuildState extends State<DrawerBuild> {
  bool isOpen = false;
  double offestX = 0;
  double offestY = 0;
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Stack(
        children: [const CustomDrawer(), buildPage()],
      ),
    );
  }

  openDrawer() {
    offestX = MediaQuery.of(context).size.width / 2.25;
    offestY = 100;
    scale = 0.75;
  }

  closeDrawer() {
    offestX = 0;
    offestY = 0;
    scale = 1;
  }

  Widget buildPage() {
    return GestureDetector(
      onHorizontalDragStart: (details) {},
      onHorizontalDragUpdate: (details) {
        details.delta.dx > 1 ? openDrawer() : closeDrawer();
        isOpen = !isOpen;
        setState(() {});
      },
      child: AnimatedContainer(
        decoration: isOpen
            ? BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(25),
              )
            : const BoxDecoration(
                color: Colors.white,
              ),
        duration: const Duration(
          milliseconds: 500,
        ),
        transform: Matrix4.translationValues(
          offestX,
          offestY,
          0,
        )..scale(scale),
        child: Home(
          openDrawer: () {
            if (isOpen) {
              closeDrawer();
            } else {
              openDrawer();
            }
            isOpen = !isOpen;
            setState(() {});
          },
        ),
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<DrawerItem> items = [
    DrawerItem(name: 'Home', icon: Icons.home),
    DrawerItem(name: 'Explore', icon: Icons.explore),
    DrawerItem(name: 'Favourite', icon: Icons.favorite),
    DrawerItem(name: 'Messages', icon: Icons.message),
    DrawerItem(name: 'Cart', icon: Icons.shop),
    DrawerItem(name: 'Settings', icon: Icons.settings),
    DrawerItem(name: 'FAQs', icon: Icons.security),
    DrawerItem(name: 'About', icon: Icons.more_horiz),
    DrawerItem(name: 'Log out', icon: Icons.logout),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Hello',
                        style: TextStyle(
                          fontFamily: 'ubi',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'lalit',
                        style: TextStyle(
                          fontFamily: 'ubi',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ...items.map(
              (e) => ListTile(
                leading: Icon(
                  e.icon,
                  color: Colors.black,
                ),
                title: Text(
                  e.name,
                  style: const TextStyle(
                    fontFamily: 'ubi',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem {
  String name;
  IconData icon;
  DrawerItem({required this.name, required this.icon});
}
