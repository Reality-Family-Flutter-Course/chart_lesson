import 'dart:math';

import 'package:chart_lesson/Bloc/transaction_bloc.dart';
import 'package:chart_lesson/Models/transaction.dart';
import 'package:flutter/material.dart';

// TODO: Переделать виджет в Stateful, сделать в инит выбор цвета и в 32 строке его использование
// TODO: Реализовать логику ключей по RandomKey и ValueKey

// ignore: must_be_immutable
class TransactionElement extends StatefulWidget {
  Transaction transaction;

  TransactionElement({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  State<TransactionElement> createState() => _TransactionElementState();
}

class _TransactionElementState extends State<TransactionElement> {
  var colors;
  var colorIndex;

  @override
  void initState() {
    super.initState();
    colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
    ];

    colorIndex = Random().nextInt(5);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 110,
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(7.5),
                  decoration: BoxDecoration(
                    color: colors[colorIndex],
                    border: Border.all(
                      width: 2,
                      color: colors[colorIndex],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.transaction.count.toStringAsFixed(2) + " руб.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              const VerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.transaction.name,
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                  const Divider(
                    height: 5,
                  ),
                  Text(
                    widget.transaction.dateString,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                onPressed: () {
                  TransactionBloc().deleteTransaction(widget.transaction);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
