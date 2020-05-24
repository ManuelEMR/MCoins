class Balance {
    final String date;
    final double balance;
    final double income;
    final double expenses;

    Balance(this.date, this.income, this.expenses): balance = income - expenses;
}