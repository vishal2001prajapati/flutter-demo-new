import 'package:flutter/material.dart';
import 'package:untitled/search/searchBar.dart';


class SearchItem extends StatefulWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asd'),
      ),
      body: Center(
        child: SearchBar(),
      ),
    );
  }
}
