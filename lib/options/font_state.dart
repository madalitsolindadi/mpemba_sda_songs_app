import 'package:flutter/material.dart';

class FontSettings with ChangeNotifier {
  double _fontSize = 18.0; // Default font size
  bool _isBold = false; // Default bold state

  double get fontSize => _fontSize;
  bool get isBold => _isBold;

  void setFontSize(double newSize) {
    _fontSize = newSize;
    notifyListeners(); // Notify listeners to rebuild
  }

  void toggleBold() {
    _isBold = !_isBold;
    notifyListeners(); // Notify listeners to rebuild
  }
}