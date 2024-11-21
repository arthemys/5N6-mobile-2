
import 'package:flutter/material.dart';
import 'package:gui/s1.dart';
import 'package:gui/tiroir.dart';

class Page3 extends StatefulWidget {
  const Page3();

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text("Gram"),
      // ),
      //drawer: LeTiroir(),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Gram"),
                MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Page1(),
                        ),
                      );
                    },
                    child: Text("Retour vers Am")
                )
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
