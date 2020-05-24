import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:records_db/records_db.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class RecentRecordsBloc extends BaseBloc {
  Stream<List<RecordWithCategory>> get records => _records.stream.map((r) {
        r.sort((a, b) => b.record.createdAt.compareTo(a.record.createdAt));
        return r;
      });

  final _records = BehaviorSubject<List<RecordWithCategory>>();

  final RecordsRepository _recordsRepository;

  RecentRecordsBloc(this._recordsRepository) {
    //TODO: Need to change this to listen to records created on the ongoing month
    _recordsRepository.records.listen(_records.add).addTo(subscriptions);
  }
}
