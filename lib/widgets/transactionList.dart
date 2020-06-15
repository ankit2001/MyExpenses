import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transaction;
  TransactionList(this._transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 20),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 1.7,
      child: ListView(
        children: (_transaction).map((tx) {
          return Container(
              child: Card(
            elevation: 10,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 10,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text('Amount in (\$)',
                          style: TextStyle(color: Colors.purple)),
                      Text(
                        tx.amount.toString() + '\$',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 17),
                    ),
                    Text(
                      DateFormat().add_yMMMEd().format(tx.date),
                    ),
                  ],
                )
              ],
            ),
          ));
        }).toList(),
      ),
    );
  }
}
