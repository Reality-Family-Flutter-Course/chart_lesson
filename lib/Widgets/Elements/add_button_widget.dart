import 'package:chart_lesson/Widgets/Elements/Interfaces/add_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSAddButtonWidget extends AddButton {
  final DateTime? transactionDate;
  final TextEditingController amountController;
  final TextEditingController titleController;

  const IOSAddButtonWidget({
    Key? key,
    required this.transactionDate,
    required this.amountController,
    required this.titleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Theme.of(context).primaryColor,
      child: const Text("Добавить"),
      onPressed: () {
        super.onPressed(
          context,
          transactionDate,
          amountController,
          titleController,
        );
      },
    );
  }
}

class AndroidAddButtonWidget extends AddButton {
  final DateTime? transactionDate;
  final TextEditingController amountController;
  final TextEditingController titleController;

  const AndroidAddButtonWidget({
    Key? key,
    required this.transactionDate,
    required this.amountController,
    required this.titleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        super.onPressed(
          context,
          transactionDate,
          amountController,
          titleController,
        );
      },
      child: const Text("Добавить"),
    );
  }
}
