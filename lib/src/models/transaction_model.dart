class TransactionModel {
  int iconId, paymentType;
  String id, name, date, hour;
  double amount;

  TransactionModel(this.id, this.iconId, this.name, this.date, this.hour,
      this.amount, this.paymentType);
}
