class Balance {
    final DateTime date;
    final double balance;
    final double income;
    final double expenses;

    const Balance(this.date, this.income, this.expenses): balance = income - expenses;

    static final Balance empty = Balance(DateTime.now(), 0, 0);
}