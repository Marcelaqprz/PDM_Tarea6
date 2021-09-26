import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class setColors with ChangeNotifier {
  //MaterialColor get c => _Colors;

  Color _color = Colors.grey;
  Color get color => _color;

  Color _textcolor = Colors.black;
  Color get textcolor => _textcolor;

  setGrey() {
    _color = Colors.grey;
    _textcolor = Colors.black;
    notifyListeners();
  }

  setBlack() {
    _color = Colors.black87;
    _textcolor = Colors.white;
    notifyListeners();
  }

  setRed() {
    _color = Colors.red;
    _textcolor = Colors.white;
    notifyListeners();
  }

  setBlue() {
    _color = Colors.blue;
    _textcolor = Colors.white;
    notifyListeners();
  }

  setGreen() {
    _color = Colors.green;
    _textcolor = Colors.white;
    notifyListeners();
  }
}
