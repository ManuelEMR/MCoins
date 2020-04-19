import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:records_db/records_db.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class HistoricBloc extends BaseBloc {
  Stream<List<RecordWithCategory>> get records => _records.stream;

  final _records = BehaviorSubject<List<RecordWithCategory>>();

  final RecordsRepository _recordsRepository;

  HistoricBloc(this._recordsRepository) {
    _recordsRepository
        .watchAllRecordsWithCategories()
        .doOnEach((notification) {
          print(notification);
        })
        .listen(_records.add)
        .addTo(subscriptions);
  }
}
