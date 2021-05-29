import 'dart:math';

import 'package:despesas_pessoais/models/transaction.dart';
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Placa Mãe Asus b250m v7',
      value: 450.85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'SSD 64 gb',
      value: 84.17,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Cooler RGB 120mm',
      value: 143.48,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionForm(_addTransaction),
      TransactionList(_transactions),
    ]);
  }
}
