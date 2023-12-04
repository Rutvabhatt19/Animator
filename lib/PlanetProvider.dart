import 'dart:convert';

import 'package:animator/PlanetDataModal.dart';
import 'package:animator/PlanetScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlanetProvider extends ChangeNotifier {
  Future<void> Ontap() async {
    String x = await rootBundle.loadString('Assates/Json/planets.json');
    List list = jsonDecode(x);
    planetlist = PlanetData.Planet(list);
    notifyListeners();
    print(planetlist);
  }
}
