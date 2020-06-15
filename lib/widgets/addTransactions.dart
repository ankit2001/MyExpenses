import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final titleChange = TextEditingController();
  final amountChange = TextEditingController();
  final Function _addTx;
  AddTransaction(this._addTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 100,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Card(
        elevation: 8,
        child: Container(
          color: Colors.grey[320],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleChange,
                //onChanged: (val) => titleChange = val,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountChange,
                // onChanged: (val) => amountChange = val,
              ),
              FlatButton(
                child: Text(
                  'Add transaction',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                onPressed: () {
                  _addTx(
                    titleChange.text,
                    double.parse(amountChange.text),
                  );
                  print(titleChange.text);
                  print(amountChange.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
