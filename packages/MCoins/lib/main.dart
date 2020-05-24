import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/platform_app.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:MCoins/presentation/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/di/data_module.dart';
import 'presentation/di/di_config.dart';
import 'presentation/di/domain_module.dart';
import 'presentation/di/presentation_module.dart';

void main() {
  setupDI([PresentationModule(), DomainModule(), DataModule()]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CategoriesBloc>(),
      ],
      child: PlatformApp(
        child: HomeScreen(),
      ),
    );
  }
}
