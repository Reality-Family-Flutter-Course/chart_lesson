import 'package:chart_lesson/Widgets/Elements/Interfaces/choose_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSChooseButtonWidget extends ChooseButton {
  final Function(DateTime?) callBack;

  const IOSChooseButtonWidget({
    Key? key,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Text("Выбрать"),
      onPressed: () {
        getDatePicker(context, callBack);
      },
    );
  }

  @override
  Future getDatePicker(
    BuildContext context,
    Function(DateTime?) callBack,
  ) async {
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 500,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumDate: DateTime(1900),
                  maximumDate: DateTime.now(),
                  use24hFormat: true,
                  onDateTimeChanged: (val) {
                    callBack(val);
                  }),
            ),

            // Close the modal
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}

class AndroidChooseButtonWidget extends ChooseButton {
  final Function(DateTime?) callBack;

  const AndroidChooseButtonWidget({
    Key? key,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("Выбрать"),
      onPressed: () {
        getDatePicker(context, callBack);
      },
    );
  }

  @override
  Future getDatePicker(
    BuildContext context,
    Function(DateTime?) callBack,
  ) async {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then(
      (value) {
        callBack(value);
      },
    );
  }
}
