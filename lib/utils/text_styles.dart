import 'package:flutter/material.dart';

textCustom(color, size, fontWeight) {
  return TextStyle(
    color: color,
    fontSize: double.parse(size.toString()),
    fontWeight: fontWeight,
  );
}
