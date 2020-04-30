import 'package:intl/intl.dart';

extension DateTimeFormats on DateTime {
  String get shortFormat {
    return DateFormat.yMd().format(this);
  }

  String get mediumFormat {
    return DateFormat.yMMMMd().format(this);
  }
}
