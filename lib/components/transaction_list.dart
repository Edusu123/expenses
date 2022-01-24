import 'transaction_item.dart';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                Container(
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                  height: constraints.maxHeight * 0.6,
                )
              ],
            );
          })
        // : ListView(
        //     children: transactions.map((e) {
        //     return TransactionItem(
        //         key: ValueKey(e.id), tr: e, onRemove: onRemove);
        //   }).toList());
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                  key: GlobalObjectKey(tr.id), tr: tr, onRemove: onRemove);
            });
  }
}
