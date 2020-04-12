import 'package:MCoins/presentation/di/di_config.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:records_db/records_db.dart';

class DataModule extends DIModule {
  @override
  void setupModule(Injector i) {
    i.map<RecordsDatabase>((_) => constructDb(logStatements: true),
        isSingleton: true);
  }
}
