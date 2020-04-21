import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:records_db/records_db.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class RecentRecordsBloc extends BaseBloc {
  Stream<List<RecordWithCategory>> get records => _records.stream;

  final _records = BehaviorSubject<List<RecordWithCategory>>();

  final RecordsRepository _recordsRepository;

  RecentRecordsBloc(this._recordsRepository) {
    // _recordsRepository
    //     .watchAllRecordsWithCategories()
    //     .listen(_records.add)
    //     .addTo(subscriptions);

    _records.add([
      RecordWithCategory(
          Record(
              createdAt: DateTime.now(),
              amount: 1345.6,
              isExpense: true,
              id: 1,
              categoryId: 2),
          Category(id: 2, name: "Food"))
    ]);
  }
}
