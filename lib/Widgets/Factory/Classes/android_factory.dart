import 'package:chart_lesson/Widgets/Elements/Interfaces/page_scaffold.dart';
import 'package:chart_lesson/Widgets/Elements/Interfaces/choose_button.dart';
import 'package:chart_lesson/Widgets/Elements/Interfaces/add_button.dart';
import 'package:chart_lesson/Widgets/Elements/add_button_widget.dart';
import 'package:chart_lesson/Widgets/Elements/choose_button_widget.dart';
import 'package:chart_lesson/Widgets/Elements/page_scaffold_widget.dart';
import 'package:chart_lesson/Widgets/Factory/Interfaces/abstract_factory.dart';
import 'package:flutter/material.dart';

class AndroidFactory implements Factory {
  @override
  AddButton getAddButton(
    DateTime? transactionDate,
    TextEditingController amountController,
    TextEditingController titleController,
  ) {
    return AndroidAddButtonWidget(
      transactionDate: transactionDate,
      amountController: amountController,
      titleController: titleController,
    );
  }

  @override
  CrossAxisAlignment getAddButtonPosition() {
    return CrossAxisAlignment.end;
  }

  @override
  ChooseButton getChooseButton(Function(DateTime?) callBack) {
    return AndroidChooseButtonWidget(callBack: callBack);
  }

  @override
  PageScaffold getPageScaffold(Widget pageBody) {
    return PageAndroidScaffoldWidget(pageBody: pageBody);
  }
}
