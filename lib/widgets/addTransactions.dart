import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function _addTx;
  AddTransaction(this._addTx);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleChange = TextEditingController();

  final amountChange = TextEditingController();

  void _submitData() {
    final titleTx = titleChange.text;
    final amountTx = double.parse(amountChange.text);
    if (titleTx.isEmpty || amountTx <= 0) {
      return;
    }
    widget._addTx(
      titleTx,
      amountTx,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
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
          padding: EdgeInsets.only(
            top: 40,
            left: 30,
            bottom: 0,
            right: 30,
          ),
          color: Theme.of(context).primaryColorDark,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                color: Theme.of(context).primaryColorLight,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: titleChange,
                  onSubmitted: (_) => _submitData,

                  //onChanged: (val) => titleChange = val,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                color: Theme.of(context).primaryColorLight,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                  controller: amountChange,
                  onSubmitted: (_) => _submitData,
                  keyboardType: TextInputType.phone,
                  // onChanged: (val) => amountChange = val,
                ),
              ),
              FlatButton(
                child: Text(
                  'Add transaction',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                onPressed: () {
                  _submitData();
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
