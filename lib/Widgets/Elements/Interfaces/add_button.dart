import 'package:chart_lesson/Bloc/transaction_bloc.dart';
import 'package:chart_lesson/Models/transaction.dart';
import 'package:flutter/material.dart';

abstract class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  void onPressed(
    BuildContext context,
    DateTime? transactionDate,
    TextEditingController amountController,
    TextEditingController titleController,
  ) {
    if (double.tryParse(amountController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Вы ввели не корректное число"),
        ),
      );
    }

    TransactionBloc().addTransaction(
      Transaction(
          name: titleController.text,
          count: double.parse(amountController.text),
          date: transactionDate ?? DateTime.now()),
    );
    Navigator.pop(context);
  }
}
