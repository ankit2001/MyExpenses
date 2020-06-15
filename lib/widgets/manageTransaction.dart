import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './addTransactions.dart';
import './transactionList.dart';

class ManageTransactions extends StatefulWidget {
  @override
  _ManageTransactionsState createState() => _ManageTransactionsState();
}

class _ManageTransactionsState extends State<ManageTransactions> {
  final List<Transaction> _transaction = [
    Transaction(
      date: DateTime.now(),
      id: '1',
      text: 'French Fries from Star Pizza',
      amount: 1.2,
    ),
    Transaction(
      date: DateTime.now(),
      id: '2',
      text: 'My New Shoes',
      amount: 35.5,
    ),
  ];
  void _addTransaction(String textTx, double amountTx) {
    final newTx = Transaction(
      text: textTx,
      amount: amountTx,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );
    setState(() {
      _transaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(_addTransaction),
        TransactionList(_transaction),
      ],
    );
  }
}
