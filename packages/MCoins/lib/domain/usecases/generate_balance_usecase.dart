import 'package:MCoins/presentation/modules/balance/models/balance.dart';
import 'package:records_db/records_db.dart';

class GenerateBalanceUseCase {

  Balance generateBalance(List<RecordWithCategory> records) {
    final date =  records.first.record.createdAt;
    final expenses = records.where((element) => element.category.isExpense);
    final incomes = records.where((element) => !element.category.isExpense);

    final expenseValue = expenses.map((e) => e.record.amount).reduce((value, element) => value + element);
    final incomeValue = incomes.map((e) => e.record.amount).reduce((value, element) => value + element);

    return Balance(date, incomeValue, expenseValue);
  }
}