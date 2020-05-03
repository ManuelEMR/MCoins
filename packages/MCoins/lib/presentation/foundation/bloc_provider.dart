import 'package:flutter/widgets.dart';
import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:provider/provider.dart';

typedef Configurator<T> = void Function(T bloc);

class BlocProvider<T extends BaseBloc> extends Provider<T> {
  BlocProvider({Widget child, Configurator<T> configurator})
      : super(
            create: (_) {
              final bloc = injector.get<T>();
              configurator?.call(bloc);
              return bloc;
            },
            dispose: (_, bloc) => bloc.dispose(),
            child: child);
}
