import 'package:flutter/material.dart';

class AppbarDemo extends StatelessWidget {
  const AppbarDemo({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        title: const Text('Home'),
        // bottom: PreferredSize(child: Container(), preferredSize: Size(0,50)),
        centerTitle: true,
        // titleSpacing: 5.0, -> is used to space between icon and name
        elevation: 0,
        // aapbar give the border
   /*     shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        ),*/
        backgroundColor: Colors.purple,
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          // IconButton(icon: const Icon(Icons.menu_book), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'App Bar',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Hello Vishal',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
