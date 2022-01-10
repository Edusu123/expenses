import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const AdaptativeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            color: Theme.of(context).primaryColor,
            onPressed: onPressed,
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : RaisedButton(
            child: Text(label),
            color: Theme.of(context).primaryColor,
            onPressed: onPressed,
            textColor: Theme.of(context).textTheme.button!.color);
  }
}
