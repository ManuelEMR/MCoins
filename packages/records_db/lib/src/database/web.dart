import 'package:moor/moor_web.dart';
import 'package:records_db/records_db.dart';

RecordsDatabase constructDb({bool logStatements = false}) {
  return RecordsDatabase(WebDatabase('db', logStatements: logStatements));
}
