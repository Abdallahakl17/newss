import 'package:flutter/material.dart';

extension Navigat on BuildContext {
  navigatTo(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }
}
