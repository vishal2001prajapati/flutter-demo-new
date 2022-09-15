import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body:
            // GridView.builder use in API Side data load
            GridView.builder(
                itemCount: 100,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      color: Colors.deepOrange,
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Item Click In ->${index}')));
                    },
                  );
                })

        /* GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
        ],
      ),*/
        );
  }
}
