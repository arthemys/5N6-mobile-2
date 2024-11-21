
import 'package:flutter/material.dart';
import 'package:gui/tiroir.dart';
import 'package:gui/s3.dart';

class Page2 extends StatefulWidget {
  const Page2();

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Stram"),
      ),
      drawer: LeTiroir(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Page3(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_right_alt),
      ),  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
