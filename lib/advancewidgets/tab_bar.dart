import 'package:flutter/material.dart';
import 'package:untitled/basicdemo/stack_view.dart';
import '../basicdemo/gesture_detector.dart';
import '../listview/listview_demo.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  State<TabBarDemo> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // it is use for back btn off
          automaticallyImplyLeading: false,
          title: Text('TabBar'),
          bottom: TabBar(

            tabs: [
              Tab(text: "Home", icon: Icon(Icons.home)),
              Tab(text: "Star", icon: Icon(Icons.star)),
              Tab(text: "Profile", icon: Icon(Icons.person))
            ],
          ),
        ),
        body: TabBarView(
          children: [ListViewDemo(), StackWidgetsDemo(), GestureDetectorDemo()],
        ),
      ));
}
