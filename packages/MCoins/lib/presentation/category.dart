import 'dart:ui';
import 'package:flutter/material.dart' show Colors;

class Category {
  final String name;
  final Color color;

  static Category food = Category._("Comida", Colors.red);
  static Category income = Category._("Ingreso", Colors.green);
  static Category entertainment = Category._("Entretenimiento", Colors.indigo);
  static Category rent = Category._("Alquiler", Colors.purple);
  static Category bills = Category._("Servicios", Colors.orange);
  static Category others = Category._("Others", Colors.blue);

  static List<Category> all = [
    income,
    food,
    entertainment,
    rent,
    bills,
    others
  ];

  const Category._(this.name, this.color);
}
