class YearTransactionModel<MonthTransactionModel> {
  final int year;
  MonthTransactionModel monthTransactions;
  YearTransactionModel(this.year, MonthTransactionModel monthTransactions);
}

class MonthTransactionModel<TransactionModel> {
  final int month;
  TransactionModel transactions;
  MonthTransactionModel(this.month, TransactionModel transactions);
}

class TransactionModel {
  int iconId, paymentType, month, year;
  String id, name, date, hour;
  double amount;

  TransactionModel(this.id, this.iconId, this.name, this.date, this.hour,
      this.amount, this.paymentType);
}
