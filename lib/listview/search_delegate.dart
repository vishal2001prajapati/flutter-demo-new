import 'package:flutter/material.dart';

class searchDelegates extends SearchDelegate {
  List<String> products = [
    'Vishal',
    'Raj',
    'Vinayak',
    'Vishal',
    'Darshan',
    'Noah',
    'Oliver',
    'Elijah',
    'Rajat',
    'Vishav',
    'Shubam',
    'Nakul',
    'Anil',
    'Pyuish',
    'Shivam',
    'Tushyuanka',
    'Mayank',
    'Suraj',
    'Anubhav',
    'Rahul',
    'Gaurav',
    'Gulzar'
  ];
  List<String> productDetails = [
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed',
    'king size bed'
  ];
  List<int> price = [
    10,
    20,
    30,
    40,
    20,
    80,
    60,
    650,
    450,
    5132,
    132,
    10,
    20,
    30,
    40,
    20,
    80,
    60,
    650,
    450,
    5132,
    132
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.cancel),
        onPressed: () {
          close(context, null);
        },

      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> filter_list = [];
    var queryTrimmed = query.trim().toLowerCase();
    if(queryTrimmed.isNotEmpty) {
      for (var i in products) {
        if (i.toLowerCase().contains(queryTrimmed)) {
          filter_list.add(i);
        }
      }
    } else {
      filter_list.addAll(products);
    }


    return ListView.builder(
        itemCount: filter_list.length,
        itemBuilder: (context, index) {
          var result_list = filter_list[index];
          return ListTile(
            title: Text(result_list),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
/*    List<String> filter_list = [];
    for (var i in products) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        filter_list.add(i);
      }
    }*/
    return ListView.builder(
        itemCount: null,
        itemBuilder: (context, index) {
          // var result_list = filter_list[index];
          return  ListTile(

          );
        });
  }
}
