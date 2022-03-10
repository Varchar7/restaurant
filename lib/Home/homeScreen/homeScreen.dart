import 'package:flutter/material.dart';
import '../individualFood/foodScreen.dart';
import '../mainData.dart';
import 'recentList.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const HomeScreen({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FoodApp? appData;

  @override
  void initState() {
    super.initState();
    appData = fetchMain();
  }

  @override
  Widget build(BuildContext context) {
    return appData == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text(
                    'Food App',
                    style: TextStyle(
                      fontFamily: 'ubi',
                      color: Colors.black,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                    ),
                  ),
                ],
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: widget.openDrawer,
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appData!.appheader,
                            style: const TextStyle(
                              fontFamily: 'ubi',
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Card(
                                  color: Colors.amber[200],
                                  child: const Icon(
                                    Icons.filter_list_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: appData!.pins.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Chip(
                                    label: Text(
                                      appData!.pins[index],
                                      style: const TextStyle(
                                        fontFamily: 'ubi',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 275,
                            child: RecentList(
                                link: appData!.pins.map((e) {
                              return 'https://source.unsplash.com/1444x1280/?${e.toLowerCase()}-food';
                            }).toList()),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, id) {
                    return SizedBox(
                      height: 325,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  appData!.foods[id].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'ubi',
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'View all',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'ubi',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: appData!.foods[id].quote.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FoodItem(
                                    food: appData!.foods[id],
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: appData!.foods.length,
                ),
              ),
            ],
          );
  }
}

class FoodItem extends StatefulWidget {
  final Food food;
  final int index;
  const FoodItem({Key? key, required this.food, required this.index})
      : super(key: key);

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) {
              return IndividualFood(
                food: widget.food.quote[widget.index],
                name: widget.food.name,
              );
            }),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.food.quote[widget.index].getLink(widget.food.name),
            ),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
            opacity: 0.25,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Hero(
                      tag: widget.food.quote[widget.index].item,
                      child: FoodImage(
                        link: widget.food.quote[widget.index]
                            .getLink(widget.food.name),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Chip(
                      avatar: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      label: Text(
                        '${widget.food.quote[widget.index].rate}',
                        style: const TextStyle(
                          fontFamily: 'ubi',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                widget.food.quote[widget.index].item,
                style: const TextStyle(
                  fontFamily: 'ubi',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.food.name,
                style: const TextStyle(
                  fontFamily: 'ubi',
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.food.quote[widget.index].price}',
                style: const TextStyle(
                  fontFamily: 'ubi',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodImage extends StatefulWidget {
  final String link;
  const FoodImage({Key? key, required this.link}) : super(key: key);

  @override
  State<FoodImage> createState() => _FoodImageState();
}

class _FoodImageState extends State<FoodImage> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.link,
      fit: BoxFit.cover,
      height: 160,
    );
  }
}
