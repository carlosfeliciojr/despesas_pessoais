import 'dart:math';

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
  final _transactions = [
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
  ];

  addTransation(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TransactionForm(
          onSubmit: addTransation,
        )
      ],
    );
  }
}
