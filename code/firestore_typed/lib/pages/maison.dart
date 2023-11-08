
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_typed/model/pipo.dart';
import 'package:firestore_typed/service.dart';
import 'package:flutter/material.dart';

class MaisonPage extends StatefulWidget {
  const MaisonPage({super.key});

  @override
  State<MaisonPage> createState() => _MaisonPageState();
}

class _MaisonPageState extends State<MaisonPage> {
  final int _counter = 0;

  List<Pipo> liste = [];

  void chargerListe() async {
    this.liste = await piposCommeUneListe();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[500],
        title: const Text("Firestore Mama!!"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              chargerListe();
              // do something
            },
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView(
                  children: this.liste.map(
                      convertisseurDePipo
                  ).toList() ,
                )
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Pipo pipo = Pipo();
          pipo.pipi = "coucou";
          pipo.popo = DateTime.now().add(const Duration(days: 7));
          pipo.popi = 999;
          await ajoutPipo(pipo);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget convertisseurDePipo(Pipo pipo) {
      return ListTile(
        leading: Text(pipo.id),
        trailing: Text(pipo.popi.toString()),
        title: Text(pipo.pipi),
        subtitle: Text(pipo.creationtime.millisecondsSinceEpoch.toString()),
      );
  }
}
