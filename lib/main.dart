import 'package:MyExpenses/widgets/manageTransaction.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final titleChange = TextEditingController();
  final amountChange = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Expenses'),
        ),
        body: ManageTransactions(),
      ),
    );
  }
}

void main() => runApp(MyApp());
