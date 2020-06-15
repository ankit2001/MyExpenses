import 'package:flutter/material.dart';

class Transaction {
  final String text;
  final DateTime date;
  final String id;
  final double amount;
  Transaction({
    @required this.text,
    @required this.date,
    @required this.id,
    @required this.amount,
    });
}
