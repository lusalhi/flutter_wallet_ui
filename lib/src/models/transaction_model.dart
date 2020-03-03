class TransactionModel {
  int iconId, paymentType, yearmonth, date;
  String id, name, hour;
  double amount;

  TransactionModel(
      {this.id,
      this.iconId,
      this.name,
      this.yearmonth,
      this.date,
      this.hour,
      this.amount,
      this.paymentType});
}
