import 'package:flutter/material.dart';
import 'package:untitled/basicdemo/stack_view.dart';
import 'Dashboard.dart';
import '../basicdemo/gesture_detector.dart';
import '../listview/listview_demo.dart';

class BottomNavigationPanel extends StatefulWidget {
  const BottomNavigationPanel({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPanel> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<BottomNavigationPanel> {
  int _currentIndex = 0;
  final screen = [
    ListViewDemo(),
    StackWidgetsDemo(),
    GestureDetectorDemo(),
    Dashboard()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // iconSize: 30,
        backgroundColor: Colors.blue,
        // fixedColor: Colors.white,
        selectedItemColor: Colors.white,
        // showUnselectedLabels -> only icon display
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            // backgroundColor: Colors.purple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
            // backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
            // backgroundColor: Colors.blue
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
