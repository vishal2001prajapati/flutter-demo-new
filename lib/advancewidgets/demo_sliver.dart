import 'package:flutter/material.dart';

import 'TransitionAppBar.dart';

class DemoSliverAppBar extends StatefulWidget {
  const DemoSliverAppBar({Key? key}) : super(key: key);

  @override
  State<DemoSliverAppBar> createState() => _DemoSliverAppBarState();
}

class _DemoSliverAppBarState extends State<DemoSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          TransitionAppBar(
            // extent: 250,
            extent: 300,
            avatar: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'images/ic_card.png'), // NetworkImage(user.imageUrl),
                      fit: BoxFit.cover)),
            ),
            title: "Emmanuel Olu-Flourish",
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
                child: ListTile(
              title: Text("${index}a"),
            ));
          }, childCount: 25))
        ],
      ),
    );
  }
}
