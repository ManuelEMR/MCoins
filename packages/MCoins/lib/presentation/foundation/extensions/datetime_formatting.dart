import 'package:intl/intl.dart';

extension DateTimeFormats on DateTime {
  String get shortFormat { // 5/12/2020
    return DateFormat.yMd().format(this);
  }

  String get mediumFormat { // May 24, 2020
    return DateFormat.yMMMMd().format(this);
  }

  String get monthYearFormat { // May 2020
    return DateFormat.yMMM().format(this);
  }
}
