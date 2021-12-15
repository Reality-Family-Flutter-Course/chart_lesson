import 'package:chart_lesson/Widgets/Elements/Interfaces/page_scaffold.dart';
import 'package:chart_lesson/Widgets/Elements/Interfaces/choose_button.dart';
import 'package:chart_lesson/Widgets/Elements/Interfaces/add_button.dart';
import 'package:chart_lesson/Widgets/Elements/add_button_widget.dart';
import 'package:chart_lesson/Widgets/Elements/choose_button_widget.dart';
import 'package:chart_lesson/Widgets/Elements/page_scaffold_widget.dart';
import 'package:chart_lesson/Widgets/Factory/Interfaces/abstract_factory.dart';
import 'package:flutter/cupertino.dart';

class IOSFactory implements Factory {
  @override
  AddButton getAddButton(
    DateTime? transactionDate,
    TextEditingController amountController,
    TextEditingController titleController,
  ) {
    return IOSAddButtonWidget(
      transactionDate: transactionDate,
      amountController: amountController,
      titleController: titleController,
    );
  }

  @override
  CrossAxisAlignment getAddButtonPosition() {
    return CrossAxisAlignment.center;
  }

  @override
  ChooseButton getChooseButton(Function(DateTime? p1) callBack) {
    return IOSChooseButtonWidget(callBack: callBack);
  }

  @override
  PageScaffold getPageScaffold(Widget pageBody) {
    return PageIOSScaffoldWidget(pageBody: pageBody);
  }
}
