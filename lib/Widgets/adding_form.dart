import 'dart:io';

import 'package:chart_lesson/Widgets/Factory/Classes/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddingForm extends StatefulWidget {
  const AddingForm({Key? key}) : super(key: key);

  @override
  State<AddingForm> createState() => _AddingFormState();
}

class _AddingFormState extends State<AddingForm> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  DateTime? transactionDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom +
                (Platform.isIOS ? 30 : 10)),
        child: Column(
          crossAxisAlignment: Config().getFactory!.getAddButtonPosition(),
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Название транзакции",
              ),
              controller: _titleController,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Сумма транзакции",
              ),
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Выбранная дата транзакции:"),
                transactionDate == null
                    ? Config().getFactory!.getChooseButton((dateTime) {
                        setState(() {
                          transactionDate = dateTime;
                        });
                      })
                    : Text(
                        DateFormat("dd.MM.yyyy").format(transactionDate!),
                      ),
              ],
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Config().getFactory!.getAddButton(
                  transactionDate,
                  _amountController,
                  _titleController,
                ),
          ],
        ),
      ),
    );
  }
}
