class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  Transaction(
      {required this.title,
      required this.value,
      required this.date,
      required this.id});
}
