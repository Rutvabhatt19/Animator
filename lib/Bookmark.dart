import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bookmark extends ChangeNotifier{
  List<String> _stringList = [];

  List<String> get stringList => _stringList;
  void saveList(String value) async {
    _stringList.add(value);
    saveListToSharedPrefs();
    notifyListeners();
  }

  void removeList(String value) async {
    _stringList.remove(value);
    saveListToSharedPrefs();
    notifyListeners();
  }

  void saveListToSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('stringList', _stringList);
  }

  void getListFromSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedList = prefs.getStringList('stringList');
    if (storedList != null) {
      _stringList = storedList;
    }
    notifyListeners();
  }

}