import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const ShopScreen({Key? key, required this.openDrawer}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Your Orders',
          style: TextStyle(
            fontFamily: 'ubi',
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: widget.openDrawer,
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://source.unsplash.com/1280x720/?pizza',
                              ),
                              fit: BoxFit.cover,
                              opacity: 0.25,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CircleAvatar(
                                  radius: 65,
                                  backgroundImage: NetworkImage(
                                    'https://source.unsplash.com/1280x720/?pizza',
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    textWidget(
                                      text: 'Item name',
                                      textColor: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textWidget(
                                      text: 'Item',
                                      textColor: Colors.black,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textWidget(
                                      text: 'Quantity',
                                      textColor: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textWidget(
                                      text: 'Total Price',
                                      textColor: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            height: 125,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Table(
                    children: [
                      TableRow(
                        children: ['Total Order Item', 'number']
                            .map(
                              (e) => textWidget(
                                text: e,
                                textColor: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                            .toList(),
                      ),
                      TableRow(
                        children: ['Total Order Price', 'price']
                            .map(
                              (e) => textWidget(
                                text: e,
                                textColor: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    primary: Colors.amber,
                    fixedSize: const Size(
                      200,
                      45,
                    ),
                  ),
                  child: textWidget(
                    text: 'Order Now',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text textWidget(
      {required String text,
      required Color textColor,
      required double fontSize,
      required FontWeight fontWeight}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'ubi',
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
