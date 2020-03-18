import 'package:cloud_firestore/cloud_firestore.dart';

class Seiyuu {
  String name;

  Seiyuu(DocumentSnapshot doc) {
    this.name = doc["name"];
  }
}
