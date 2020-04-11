import 'package:MCoins/presentation/foundation/navigation/screen.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_screen.dart';
import 'package:flutter/widgets.dart';

class HomeRouter {
  void openCreateRecord(BuildContext context) {
    final screen = Screen(CreateRecordScreen());
    screen.show<void>(context);
  }
}
