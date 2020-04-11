import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/modules/home/home_router.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class PresentationModule extends DIModule {
  @override
  void setupModule(Injector i) {
    i.map<HomeRouter>((_) => HomeRouter());
  }
}
