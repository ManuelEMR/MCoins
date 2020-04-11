import 'dart:ui';

import 'package:categories_repo/categories_repo.dart';
import 'package:flutter/material.dart';

extension CategoryColor on Category {
  Color color() {
    if (this == Category.income) return Colors.green;
    if (this == Category.food) return Colors.red;
    if (this == Category.entertainment) return Colors.orange;
    if (this == Category.bills) return Colors.yellow;
    if (this == Category.rent) return Colors.blue;
    if (this == Category.others) return Colors.indigo;
    throw Exception("Color not defined");
  }
}
