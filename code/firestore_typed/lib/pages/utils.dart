import 'package:firestore_typed/model/pipo.dart';
import 'package:flutter/material.dart';

Widget convertisseurDePipo(Pipo pipo) {
  return Card(
    color: Colors.indigoAccent,
    child: ListTile(
      leading: Text(pipo.id),
      trailing: Text(pipo.popi.toString()),
      title: Text(pipo.pipi),
      subtitle: Text(pipo.creationtime.millisecondsSinceEpoch.toString()),
    ),
  );
}