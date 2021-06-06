// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../models/transaction.dart';

// class TransactionList extends StatefulWidget {
//   final List<Transaction> transactions;

//   TransactionList(this.transactions);

//   @override
//   _TransactionListState createState() => _TransactionListState();
// }

// class _TransactionListState extends State<TransactionList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       child: widget.transactions.isEmpty
//           ? Column(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'Nenhuma Transação Cadastrada!',
//                   style: TextStyle(
//                     fontFamily: 'OpenSans',
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Image(
//                   image: AssetImage(
//                     'assets/images/waiting.png',
//                   ),
//                   fit: BoxFit.cover,
//                   width: 80,
//                 )
//               ],
//             )
//           : ListView.builder(
//               itemCount: widget.transactions.length,
//               itemBuilder: (context, index) {
//                 final tr = widget.transactions[index];
//                 return Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                           horizontal: 15,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.purple,
//                             width: 2,
//                           ),
//                         ),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           "R\$ ${tr.value.toStringAsFixed(2)}",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.purple),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             tr.title,
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             DateFormat('d MMM y').format(tr.date),
//                             style: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
