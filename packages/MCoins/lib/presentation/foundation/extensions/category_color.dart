import 'dart:ui';

import 'package:records_db/records_db.dart';
import 'package:flutter/material.dart';

extension CategoryColor on Category {
  Color get color {
    switch (id) {
      case 1: //income
      case 2: //deposits
        return Colors.green;
      default:
        return Colors.red;
    }
  }
}
