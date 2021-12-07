import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta #01',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta #02',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta #03',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Conta #04',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Conta #05',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}