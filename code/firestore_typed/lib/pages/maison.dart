import 'dart:math';

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

  void chargerListeSous50() async {
    this.liste = await piposSous50();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[500],
        title: const Text("Firestore Mama!!"),
        actions: <Widget>[
          TextButton(
            child: Text(
              "<50",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              chargerListeSous50();
              // do something
            },
          ),
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
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: ListView(
                children: this.liste.map(
                    convertisseurDePipo
                ).toList() ,
              )
          ),

          Expanded(
              child: StreamBuilder<List<Pipo>>(
                stream: piposCommeUnStream(),
                builder: (BuildContext context, AsyncSnapshot<List<Pipo>> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  return ListView(
                    children: snapshot.data!
                        .map( convertisseurDePipo )
                        .toList(),
                  );
                },
              )
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Pipo pipo = Pipo();
          pipo.pipi = "coucou";
          pipo.popo = DateTime.now().add(const Duration(days: 7));
          pipo.popi = Random().nextInt(100);
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
