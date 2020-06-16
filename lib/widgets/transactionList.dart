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
      height: MediaQuery.of(context).size.height / 1.2,
      child: _transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction is Added',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Image(
                    image: AssetImage('assets/image/waiting.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView(
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
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Amount in (\$)',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'QuickSand',
                              ),
                            ),
                            Text(
                              tx.amount.toStringAsFixed(2) + '\$',
                              style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).primaryColorDark,
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
                              color: Theme.of(context).primaryColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .fontSize,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .fontFamily,
                            ),
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
