import 'package:MCoins/domain/usecases/generate_balance_usecase.dart';
import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:MCoins/presentation/modules/balance/models/balance.dart';
import 'package:records_db/records_db.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class RecentRecordsBloc extends BaseBloc {
  Stream<List<RecordWithCategory>> get records => _records.stream.map((r) {
        r.sort((a, b) => b.record.createdAt.compareTo(a.record.createdAt));
        return r;
      });

  Stream<Balance> get balance => records.map(_generateBalanceUseCase.generateBalance);

  final _records = BehaviorSubject<List<RecordWithCategory>>();

  final RecordsRepository _recordsRepository;
  final GenerateBalanceUseCase _generateBalanceUseCase;

  RecentRecordsBloc(this._recordsRepository, this._generateBalanceUseCase) {
    final now = DateTime.now();
    _recordsRepository
        .watchRecordsIn(now.month, now.year)
        .listen(_records.add)
        .addTo(subscriptions);
  }
}
