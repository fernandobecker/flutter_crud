import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';

import '../models/user.dart';

class UsersProviders with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(User user){
    if(user.id.trim().isEmpty || !_items.containsKey(user.id)) {
      final id = generateUniqueId();
      _items.putIfAbsent(id, () => user.copyWith(id: id));
    } else {
      _items.update(user.id, (_) => user);
    }
    notifyListeners();
  }

  void remove(User user) {
    _items.remove(user.id);
    notifyListeners();
  }

  String generateUniqueId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    const idLength = 8;
    return List.generate(idLength, (index) => chars[random.nextInt(chars.length)]).join();
  }

}