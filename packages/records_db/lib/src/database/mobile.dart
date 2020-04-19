import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:records_db/src/database.dart';

LazyDatabase _openConnection(bool logStatements) {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called records_db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();

    final file = File(p.join(dbFolder.path, 'records_db.sqlite'));
    return VmDatabase(file, logStatements: logStatements);
  });
}

RecordsDatabase constructDb({bool logStatements = true}) {
  return RecordsDatabase(_openConnection(logStatements));
}
