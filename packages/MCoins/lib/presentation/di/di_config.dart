import 'package:flutter_simple_dependency_injection/injector.dart';

///This method needs to be called before the 'runApp' function in main
///
void setupDI(List<DIModule> modules) {
  modules.forEach((m) => m.setupModule(injector));
}

abstract class DIModule {
  void setupModule(Injector i);
}

Injector get injector => Injector.getInjector();
