import 'package:MCoins/presentation/foundation/navigation/screen.dart';
import 'package:MCoins/presentation/modules/balance/balance_screen.dart';
import 'package:MCoins/presentation/modules/category_detail/category_detail_screen.dart';
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

  void openCategoryDetail(BuildContext context, Category category) {
    final screen = Screen(CategoryDetailScreen(category: category));
    screen.pushSelf<void>(context);
  }

  void openBalanceScreen(BuildContext context) {
    final screen = Screen(BalanceScreen());
    screen.pushSelf<void>(context);
  }
}
