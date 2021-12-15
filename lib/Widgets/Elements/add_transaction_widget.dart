import 'package:chart_lesson/Widgets/Elements/Interfaces/add_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../adding_form.dart';

class IOSAddTransactionWidget extends AddTransaction {
  const IOSAddTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(
        CupertinoIcons.add,
        color: Colors.white,
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const AddingForm(),
        );
      },
    );
  }
}

class AndroidAddTransactionWidget extends AddTransaction {
  const AndroidAddTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const AddingForm(),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
