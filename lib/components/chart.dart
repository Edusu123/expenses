import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_time_patterns.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
    });
  }

  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    groupedTransactions;

    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: groupedTransactions.map((tr) {
            return ChartBar(
                label: tr['day'].toString(),
                value: tr['value'] as double,
                percentage: 0.3);
          }).toList(),
        ));
  }
}
