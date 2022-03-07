import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
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
      ),
      backgroundColor: Color.fromARGB(255, 255, 243, 207),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
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
                              'https://source.unsplash.com/1280x720/?pizza'),
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
                                  'https://source.unsplash.com/1280x720/?pizza'),
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
                        icon: Icon(
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
          Container(
            decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: 125,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    primary: Colors.amber,
                    fixedSize: Size(
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
