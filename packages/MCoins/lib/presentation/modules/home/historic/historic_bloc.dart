import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:MCoins/presentation/modules/home/models/category_record.dart';
import 'package:records_repo/records_repo.dart';
import 'package:rxdart/subjects.dart';

class HistoricBloc extends BaseBloc {
  Stream<List<CategoryRecord>> get records => _records.stream;

  final _records = BehaviorSubject<List<CategoryRecord>>();
}
