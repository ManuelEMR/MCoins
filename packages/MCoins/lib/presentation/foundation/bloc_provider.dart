import 'package:flutter/widgets.dart';
import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:provider/provider.dart';

class BlocProvider<T extends BaseBloc> extends Provider<T> {
  BlocProvider({Widget child})
      : super(
            create: (_) => injector.get<T>(),
            dispose: (_, bloc) => bloc.dispose(),
            child: child);
}
