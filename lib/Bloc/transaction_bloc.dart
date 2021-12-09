import 'package:chart_lesson/Models/transaction.dart';

class TransactionBloc {
  static TransactionBloc? _instance;

  TransactionBloc._internal();

  factory TransactionBloc() {
    _instance ??= TransactionBloc._internal();
    return _instance!;
  }

  final List<Transaction> _transactions = [
    Transaction(name: "Кроссовки", count: 2500, date: DateTime.now()),
    Transaction(name: "Куртка", count: 5000, date: DateTime.now()),
    Transaction(name: "Вода", count: 50, date: DateTime.now()),
  ];

  final List<Function> _callBacks = [];

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    for (var element in _callBacks) {
      element();
    }
  }

  bool deleteTransaction(Transaction transaction) {
    bool result = _transactions.remove(transaction);
    for (var element in _callBacks) {
      element();
    }
    return result;
  }

  void addCallBack(Function callback) => _callBacks.add(callback);
  bool deleteCallBack(Function callback) => _callBacks.remove(callback);
}
