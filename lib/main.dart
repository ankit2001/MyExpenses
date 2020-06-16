import 'package:flutter/cupertino.dart';

import './widgets/addTransactions.dart';
import './widgets/transactionList.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

class MyExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyExpenses',
      home: MyHomepage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.red,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final List<Transaction> _transaction = [
    
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

  void _addNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () => {},
          child: AddTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addNewTransaction(context),
          ),
        ],
      ),
      body: TransactionList(_transaction),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNewTransaction(context),
        elevation: 10,
      ),
    );
  }
}

void main() => runApp(MyExpenses());
