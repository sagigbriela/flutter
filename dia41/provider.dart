import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ContadorProvider with ChangeNotifier{
  double _counter;

  double get counter => _counter;

  set counter(double value) {
    _counter = value;
  }

  ContadorProvider(this._counter);

  void increment(){
    _counter+=5;
    notifyListeners();
  }

}