
import 'package:flutter/material.dart';
import 'package:gui/s2.dart';
import 'package:gui/tiroir.dart';

class Page1 extends StatefulWidget {
  const Page1();

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Am"),
      ),
      drawer: LeTiroir(),
      body: Column(
        children: [
          Expanded(child: Container(color:Colors.blue),flex: 6),
          Expanded(child: Container(color:Colors.green),),
          Container(color:Colors.yellow, height: 222,width:222),
          Expanded(child: Container(color:Colors.red),flex: 3),
          Expanded(child: Container(color:Colors.orange),flex:4),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
