import 'dart:math';

import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            button: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransation(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onSubmit: _addTransation,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransactions: _recentTransactions),
            TransactionList(
                transactions: _transactions,
                deleteTransaction: _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
