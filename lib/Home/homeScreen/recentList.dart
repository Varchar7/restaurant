import 'package:flutter/material.dart';

class RecentList extends StatefulWidget {
  final List<String> link;
  const RecentList({Key? key, required this.link}) : super(key: key);

  @override
  State<RecentList> createState() => _RecentListState();
}

class _RecentListState extends State<RecentList>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Recently Seen',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'ubi',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: tabController!,
              children: List.generate(
                5,
                (index) => Stack(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        widget.link[index],
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30.0,
                            left: 10,
                            right: 10,
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Explore the beauty',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'ubi',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Get Special offer and discount',
                                          style: TextStyle(
                                            fontFamily: 'ubi',
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
