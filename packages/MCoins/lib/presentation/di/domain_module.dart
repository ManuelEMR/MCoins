import 'package:MCoins/domain/usecases/generate_balance_usecase.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'di_config.dart';

class DomainModule extends DIModule {
  @override
  void setupModule(Injector i) {
    i.map<GenerateBalanceUseCase>((_) => GenerateBalanceUseCase());
  }
}