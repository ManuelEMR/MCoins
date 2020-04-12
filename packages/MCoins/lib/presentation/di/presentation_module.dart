import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_bloc.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:MCoins/presentation/modules/home/home_router.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:records_repo/records_repo.dart';

class PresentationModule extends DIModule {
  @override
  void setupModule(Injector i) {
    i.map<HomeRouter>((_) => HomeRouter());

    // Blocs
    i.map((i) => CategoriesBloc(i.get<RecordsDatabase>()));
    i.map((i) => CreateRecordBloc(i.get<RecordsDatabase>()));
  }
}
