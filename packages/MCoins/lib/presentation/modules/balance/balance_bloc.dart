import 'package:MCoins/domain/usecases/generate_balance_usecase.dart';
import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:MCoins/presentation/modules/balance/models/balance.dart';
import 'package:MCoins/presentation/foundation/extensions/datetime_formatting.dart';
import 'package:flutter/foundation.dart';
import 'package:records_db/records_db.dart';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart' as collection_utils;

class BalanceBloc extends BaseBloc {
  Stream<List<Balance>> get balances => _balances.stream;

  final _balances = BehaviorSubject<List<Balance>>.seeded([]);

  final GenerateBalanceUseCase _generateBalanceUseCase;
  final RecordsRepository _recordsRepository;

  BalanceBloc(this._recordsRepository, this._generateBalanceUseCase) {
    _recordsRepository.records
        .map((records) => collection_utils.groupBy(records, _shortDate))
        .map((grouped) => grouped.values)
        .map((groupedRecords) => groupedRecords
            .map(_generateBalanceUseCase.generateBalance)
            .toList())
        .doOnData((event) {
          debugPrint('Events $event');
        })
        .listen(_balances.add, onError: (Object error) {
          debugPrint(error.toString());
        })
        .addTo(subscriptions);

    _recordsRepository.records.listen((event) {
      debugPrint("RECORDS $event");
    });
  }

  String _shortDate(RecordWithCategory recordWithCategory) {
    final date = recordWithCategory.record.createdAt;
    return date.monthYearFormat;
  }
}
