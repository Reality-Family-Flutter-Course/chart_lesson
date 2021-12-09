import 'package:chart_lesson/Bloc/transaction_bloc.dart';
import 'package:chart_lesson/Widgets/chart_element.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ChartsList extends StatefulWidget {
  const ChartsList({Key? key}) : super(key: key);

  @override
  State<ChartsList> createState() => _ChartsListState();
}

class _ChartsListState extends State<ChartsList> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    TransactionBloc().addCallBack(() {
      setState(() {});
    });
  }

  List<Map<String, dynamic>> get groupedTransactionsValues => List.generate(
        7,
        (index) {
          final weekDay = DateTime.now().subtract(Duration(days: index));

          var totalSum = 0.0;
          for (var transaction in TransactionBloc().transactions) {
            if (transaction.date.day == weekDay.day &&
                transaction.date.month == weekDay.month &&
                transaction.date.year == weekDay.year) {
              totalSum += transaction.count;
            }
          }

          return {
            "day": DateFormat.E("ru_RU").format(weekDay),
            "amount": totalSum
          };
        },
      ).reversed.toList();

  double get totalSpending => groupedTransactionsValues.fold(
        0.0,
        (sum, element) => sum += element["amount"],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: groupedTransactionsValues
                .map(
                  (date) => ChartElement(
                      title: date["day"],
                      count: date["amount"],
                      procentCount: totalSpending == 0
                          ? 0.0
                          : date['amount'] / totalSpending),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
