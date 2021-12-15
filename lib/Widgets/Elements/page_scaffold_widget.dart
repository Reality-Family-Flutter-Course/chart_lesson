import 'package:chart_lesson/Widgets/Elements/Interfaces/page_scaffold.dart';
import 'package:chart_lesson/Widgets/Elements/add_transaction_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Interfaces/page_scaffold.dart';

class PageIOSScaffoldWidget extends PageScaffold {
  final Widget pageBody;

  const PageIOSScaffoldWidget({
    Key? key,
    required this.pageBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: pageBody,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        middle: const Text(
          "ChartApp",
          style: TextStyle(fontFamily: "Quiksand", color: Colors.white),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            IOSAddTransactionWidget(),
          ],
        ),
      ),
    );
  }
}

class PageAndroidScaffoldWidget extends PageScaffold {
  final Widget pageBody;

  const PageAndroidScaffoldWidget({
    Key? key,
    required this.pageBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ChartApp",
          style: TextStyle(
            fontFamily: "Quiksand",
          ),
        ),
      ),
      body: pageBody,
      floatingActionButton: const AndroidAddTransactionWidget(),
    );
  }
}
