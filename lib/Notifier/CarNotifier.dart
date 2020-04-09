import 'dart:collection';

import 'package:toyota_app/Models/Car.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class CarNotifier with ChangeNotifier {
  List<Car> _carList = [];
  Car _currentCar;

  UnmodifiableListView<Car> get carList => UnmodifiableListView(_carList);

  Car get currentCar => _currentCar;

  set carList(List<Car> carList) {
    _carList = carList;
    notifyListeners();
  }

  set currentCar(Car car) {
    _currentCar = car;
    notifyListeners();
  }
}