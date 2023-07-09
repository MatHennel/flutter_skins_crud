import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/data/dummy_users.dart';
import 'package:flutter_skins_crud/models/user.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id!.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id.toString(),
        (_) => User(
          id: user.id,
          name: user.name,
          preco: user.preco,
          arma: user.arma,
          desgaste: user.desgaste,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          preco: user.preco,
          arma: user.arma,
          desgaste: user.desgaste,
          avatarUrl: user.avatarUrl,
        ),
      );
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
