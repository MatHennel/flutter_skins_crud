import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_skins_crud/models/skin.dart';

class CrudService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  void remove(Skin skin) {
    _firestore.collection(uid).doc(skin.id).delete();
  }

  FirebaseFirestore getFireStore() {
    return _firestore;
  }

  String getUid() {
    return uid;
  }
}
