import 'package:flutter/material.dart';
import 'package:untitled/listview/search_delegate.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = const Text('ListView');

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

  // filter data
  // void updateList(String value) {
  //   setState(() {
  //     products
  //         .where(
  //             (element) => element.toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print(products.length);
    print(productDetails.length);
    print(price.length);

    return Scaffold(
      appBar: AppBar(
        title: cusSearchBar,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: searchDelegates());
            },
          ),
        ],
      ),
      drawer: Drawer(
        // backgroundColor: Colors.green,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountEmail: Text('abc@gmail.com'),
              currentAccountPicture: CircleAvatar(
                  foregroundImage: AssetImage("image/image_temp.jpeg")),
              accountName: Text('abc'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Shop'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Labels',
                // textAlign:TextAlign.center,
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: (products != null && products.isNotEmpty)
            ? ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          leading: CircleAvatar(
                            child: Text(products[index][0]),
                          ),
                          title: Text(products[index]),
                          subtitle: Text(productDetails[index]),
                          trailing: Text(price[index].toString())),
                      Divider()
                    ],
                  );
                },
              )
            : Container(child: Text("NO data")),
      ),
    );
  }
}
