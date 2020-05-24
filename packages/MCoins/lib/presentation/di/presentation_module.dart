import 'package:MCoins/domain/usecases/generate_balance_usecase.dart';
import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/modules/category_detail/category_detail_bloc.dart';
import 'package:MCoins/presentation/modules/category_detail/category_detail_router.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_bloc.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:MCoins/presentation/modules/home/recents/recent_records_bloc.dart';
import 'package:MCoins/presentation/modules/home/home_router.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:records_db/records_db.dart';

class PresentationModule extends DIModule {
  @override
  void setupModule(Injector i) {
    i.map<HomeRouter>((_) => HomeRouter());
    i.map<CategoryDetailRouter>((_) => CategoryDetailRouter());

    // Blocs
    i.map((i) => CategoriesBloc(i.get<RecordsDatabase>()));
    i.map((i) => RecentRecordsBloc(i.get<RecordsRepository>(), i.get<GenerateBalanceUseCase>()));
    i.map((i) => UpsertRecordBloc(
        i.get<CategoriesRepository>(), i.get<RecordsRepository>()));
    i.map((i) => CategoryDetailBloc(i.get<RecordsRepository>()));
  }
}
