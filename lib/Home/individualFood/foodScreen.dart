import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../mainData.dart';

class IndividualFood extends StatefulWidget {
  final Quote food;
  const IndividualFood({Key? key, required this.food}) : super(key: key);

  @override
  State<IndividualFood> createState() => _IndividualFoodState();
}

class _IndividualFoodState extends State<IndividualFood> {
  int item = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              widget.food.item,
              style: const TextStyle(
                fontFamily: 'ubi',
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Hero(
                    tag: widget.food.item,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        widget.food.link,
                        fit: BoxFit.cover,
                        height: 310,
                        width: MediaQuery.of(context).size.width,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (item == 0) {
                                  } else {
                                    item--;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                size: 25,
                              ),
                            ),
                            Text(
                              '$item',
                              style: const TextStyle(
                                fontFamily: 'ubi',
                                fontSize: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  item++;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            expandedHeight: 350,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        widget.food.item,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ubi',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        widget.food.price,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ubi',
                        ),
                      ),
                    ),
                  ],
                ),
                iconField(like: '420', rate: '4.5', time: '20-22'),
                const Divider(
                  indent: 2,
                  thickness: 2,
                  height: 5,
                  color: Colors.black,
                ),
                item == 0
                    ? const SizedBox()
                    : Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.amber[50],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Receipt',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ubi',
                                ),
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 7,
                                    child: Text(
                                      'Quantity',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'ubi',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'x $item',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'ubi',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 7,
                                    child: Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        fontFamily: 'ubi',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      '${(double.parse(widget.food.price.substring(0, 4)) * item).toStringAsFixed(2)} \$',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'ubi',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                const Text(
                  'Introduction',
                  style: TextStyle(
                    fontFamily: 'ubi',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  '''pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot. One of the simplest and most traditional pizzas is the Margherita, which is topped with tomatoes or tomato sauce, mozzarella, and basil. Popular legend relates that it was named for Queen Margherita, wife of Umberto I, who was said to have liked its mild fresh flavour and to have also noted that its topping colours—green, white, and red—were those of the Italian flag.''',
                  style: TextStyle(
                    fontFamily: 'ubi',
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )
              ]
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        height: 60,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['Add to Cart', 'Order Now']
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width / 2.25, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontFamily: 'ubi',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}

class IconField {
  String name;
  IconData icon;
  IconField({required this.name, required this.icon});
}

Widget iconField({
  required String rate,
  required String like,
  required String time,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconField(
        name: rate,
        icon: Icons.star,
      ),
      IconField(
        name: like,
        icon: Icons.thumb_up,
      ),
      IconField(
        name: time,
        icon: Icons.alarm,
      )
    ]
        .map(
          (e) => Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: [
              Icon(
                e.icon,
                color: Colors.grey,
              ),
              Text(
                e.name,
                style: const TextStyle(
                  fontFamily: 'ubi',
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
        .toList(),
  );
}
