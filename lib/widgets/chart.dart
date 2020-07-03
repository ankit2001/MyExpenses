import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTx;
  Chart(this.recentTx);
  List<Map<String, Object>> get weeklyTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(
        days: index,
      ));
      double finalAmount = 0;
      for (var i = 0; i < recentTx.length; i++) {
        if (recentTx[i].date.day == weekDay.day &&
            recentTx[i].date.month == weekDay.month &&
            recentTx[i].date.year == weekDay.year) {
          finalAmount += recentTx[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': finalAmount,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(weeklyTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
