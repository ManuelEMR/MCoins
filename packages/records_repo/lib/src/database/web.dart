import 'package:moor/moor_web.dart';
import 'package:records_repo/records_repo.dart';

RecordsDatabase constructDb({bool logStatements = false}) {
  return RecordsDatabase(WebDatabase('db', logStatements: logStatements));
}
