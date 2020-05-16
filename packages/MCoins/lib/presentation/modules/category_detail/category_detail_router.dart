import 'package:MCoins/presentation/foundation/navigation/screen.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:records_db/records_db.dart';

class CategoryDetailRouter {
  void openCreateRecord(BuildContext context,
      Category category) {
    final screen =
        Screen(CreateRecordScreen(recordWithCategory: RecordWithCategory(null, category)));
    screen.show<void>(context);
  }
}