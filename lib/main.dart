import 'package:chart_lesson/Widgets/adding_form.dart';
import 'package:chart_lesson/Widgets/charts_list.dart';
import 'package:chart_lesson/Widgets/transactions_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amber,
            ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          ChartsList(),
          TransactionsList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
      ),
    );
  }
}
