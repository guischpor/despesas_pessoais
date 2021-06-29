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
    print('build() TransactionList');
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
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('R\$${tr.value.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('d MM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          label: Text('Excluir'),
                          textColor: Colors.purple,
                          onPressed: () => widget.onRemove(tr.id),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => widget.onRemove(tr.id),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
          );
  }
}
