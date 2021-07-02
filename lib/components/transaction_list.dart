import 'package:despesas_pessoais/components/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                    image: AssetImage(
                      'assets/images/waiting.png',
                    ),
                    fit: BoxFit.cover,
                    height: constraints.maxHeight * 0.6,
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: widget.transactions.length,
            itemBuilder: (context, index) {
              final tr = widget.transactions[index];
              return TransactionItem(
                tr: tr,
                onRemove: widget.onRemove,
              );
            },
          );
  }
}
