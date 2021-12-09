import 'package:chart_lesson/Bloc/transaction_bloc.dart';
import 'package:chart_lesson/Models/transaction.dart';
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
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
              Text("Выбранная дата транзакции:"),
              transactionDate == null
                  ? TextButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now())
                            .then(
                          (value) {
                            setState(() {
                              transactionDate = value;
                            });
                          },
                        );
                      },
                      child: const Text("Выбрать"),
                    )
                  : Text(
                      DateFormat("dd.MM.yyyy").format(transactionDate!),
                    ),
            ],
          ),
          const Divider(
            color: Colors.transparent,
          ),
          ElevatedButton(
            onPressed: () {
              if (double.tryParse(_amountController.text) == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Вы ввели не корректное число"),
                  ),
                );
              }

              TransactionBloc().addTransaction(
                Transaction(
                    name: _titleController.text,
                    count: double.parse(_amountController.text),
                    date: transactionDate ?? DateTime.now()),
              );
              Navigator.pop(context);
            },
            child: const Text("Добавить"),
          )
        ],
      ),
    );
  }
}
