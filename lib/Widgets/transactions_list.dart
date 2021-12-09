import 'package:chart_lesson/Bloc/transaction_bloc.dart';
import 'package:chart_lesson/Widgets/transaction_element.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({Key? key}) : super(key: key);

  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  late Function callback;

  @override
  void initState() {
    callback = () {
      setState(() {});
    };
    TransactionBloc().addCallBack(callback);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, position) => TransactionElement(
          transaction: TransactionBloc().transactions[position],
        ),
        itemCount: TransactionBloc().transactions.length,
      ),
    );
  }

  @override
  void dispose() {
    TransactionBloc().deleteCallBack(callback);
    super.dispose();
  }
}
