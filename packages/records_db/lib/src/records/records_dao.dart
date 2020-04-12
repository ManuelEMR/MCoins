import 'package:moor/moor.dart';
import 'package:records_db/src/database.dart';

import 'records_table.dart';

part 'records_dao.g.dart';

@UseDao(tables: [Records])
class RecordsDao extends DatabaseAccessor<RecordsDatabase>
    with _$RecordsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  RecordsDao(RecordsDatabase db) : super(db);

  Future<int> addRecord(RecordsCompanion entry) {
    return db.into(db.records).insert(entry);
  }
}
