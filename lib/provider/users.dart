import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/data/dummy_users.dart';
import 'package:flutter_skins_crud/models/skin.dart';
import 'package:uuid/uuid.dart';

class UsersProvider with ChangeNotifier {
  Map<String, Skin> _items = {...DUMMY_USERS};
  List<Skin> lista = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Skin> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Skin byIndex(int i) {
    refresh();
    notifyListeners();
    return _items.values.elementAt(i);
  }

  void put(Skin skin) {
    if (skin == null) {
      return;
    }

    if (skin.id != null &&
        skin.id!.trim().isNotEmpty &&
        _items.containsKey(skin.id)) {
      _items.update(
        skin.id.toString(),
        (_) => Skin(
          id: skin.id,
          name: skin.name,
          preco: skin.preco,
          arma: skin.arma,
          desgaste: skin.desgaste,
          avatarUrl: skin.avatarUrl,
        ),
      );
    } else {
      refresh();
      final id = const Uuid().v1();

      _items.putIfAbsent(
        id,
        () => Skin(
          id: id,
          name: skin.name,
          preco: skin.preco,
          arma: skin.arma,
          desgaste: skin.desgaste,
          avatarUrl: skin.avatarUrl,
        ),
      );
    }

    // Enviar para o Firestore
    firestore.collection("lista_skins").doc("skins").set(
        {"data": _items.map((key, value) => MapEntry(key, value.toMap()))});

    notifyListeners();
  }

  void remove(Skin skin) {
    if (skin.id != null) {
      _items.remove(skin.id);
      notifyListeners();

      firestore
          .collection("lista_skins")
          .doc("skins")
          .collection("data")
          .doc(skin.id)
          .delete();
    }
  }

  void refresh() async {
    List<Skin> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection("lista_skins")
        .doc("skins")
        .collection("data")
        .get();

    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        temp.add(Skin.fromMap(doc.data()));
      }
    }

    _items =
        Map.fromIterable(temp, key: (skin) => skin.id) as Map<String, Skin>;

    lista = List.from(temp);

    notifyListeners();
  }
}
