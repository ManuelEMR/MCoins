import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_bloc.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:MCoins/presentation/modules/home/historic/historic_bloc.dart';
import 'package:MCoins/presentation/modules/home/home_router.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:records_db/records_db.dart';

class PresentationModule extends DIModule {
  @override
  void setupModule(Injector i) {
    i.map<HomeRouter>((_) => HomeRouter());

    // Blocs
    i.map((i) => CategoriesBloc(i.get<RecordsDatabase>()));
    i.map((i) => HistoricBloc(i.get<RecordsRepository>()));
    i.map((i) => CreateRecordBloc(
        i.get<CategoriesRepository>(), i.get<RecordsRepository>()));
  }
}
