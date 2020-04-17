import 'package:records_db/records_db.dart';

class RecordsRepository {
  final RecordsDao _dao;

  RecordsRepository(this._dao);

  Stream<List<Record>> watchAllRecords() => _dao.watchRecords();
}
