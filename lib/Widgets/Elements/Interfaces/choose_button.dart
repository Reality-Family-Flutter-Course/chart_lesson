import 'package:flutter/material.dart';

abstract class ChooseButton extends StatelessWidget {
  const ChooseButton({Key? key}) : super(key: key);

  Future getDatePicker(
    BuildContext context,
    Function(DateTime?) callBack,
  );
}
