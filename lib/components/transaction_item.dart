import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
    Colors.indigo
  ];

  Color _backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(6);
    print(i);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(child: Text('R\$${widget.tr.value}')),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat('d MMM y').format(widget.tr.date)),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                textColor: Theme.of(context).errorColor)
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => widget.onRemove(widget.tr.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
