import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final transactions = [
    Transaction(
        title: 'Novo tenis de corrida',
        value: 310.50,
        date: DateTime.now(),
        id: 't1'),
    Transaction(
      title: 'Conta de luz',
      value: 150.20,
      date: DateTime.now(),
      id: 't2',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: transactions),
        TransactionForm()
      ],
    );
  }
}
