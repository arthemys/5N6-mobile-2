// l'idée est de regrouper tous les accès aux données au même endroit
// validation avant d'écrire
// tri, post-traitement etc après lecture

// Doc de référence : https://firebase.google.com/docs/firestore/quickstart?hl=fr


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_typed/model/pipo.dart';

final collectionRef = FirebaseFirestore
    .instance
    .collection("pipo")
    .withConverter(
  fromFirestore: Pipo.fromFirestore,
  toFirestore: (Pipo pipo, options) => pipo.toFirestore(),
);


Future<void> ajoutPipo(Pipo pipo) async {
  await collectionRef.add(pipo);
  return;
}

Future<List<Pipo>> piposCommeUneListe() async {
  Pipo pipo = Pipo();
  pipo.pipi = "coucou";
  pipo.popo = DateTime.now().add(const Duration(days: 7));
  pipo.popi = 99^99;
  pipo.creationtime = Timestamp.now();
  QuerySnapshot<Pipo> requete = await collectionRef.get();
  List<Pipo> resultat = [];
  for (QueryDocumentSnapshot<Pipo> element in requete.docs) {
    resultat.add(element.data());
  }
  return resultat;
}