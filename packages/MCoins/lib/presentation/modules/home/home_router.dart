import 'package:MCoins/presentation/foundation/navigation/screen.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:records_db/records_db.dart';

class HomeRouter {
  void openCreateRecord(BuildContext context,
      [RecordWithCategory recordWithCategory]) {
    final screen =
        Screen(CreateRecordScreen(recordWithCategory: recordWithCategory));
    screen.show<void>(context);
  }
}
