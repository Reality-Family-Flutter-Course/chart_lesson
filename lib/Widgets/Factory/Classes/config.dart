import 'dart:io';
import 'package:chart_lesson/Widgets/Factory/Classes/android_factory.dart';
import 'package:chart_lesson/Widgets/Factory/Classes/ios_factory.dart';
import 'package:chart_lesson/Widgets/Factory/Interfaces/abstract_factory.dart';

class Config {
  static Config? _instance;
  Factory? _factory;

  Config._init() {
    if (Platform.isAndroid) {
      _factory = AndroidFactory();
    } else if (Platform.isIOS) {
      _factory = IOSFactory();
    } else {
      _factory = null;
    }
  }

  Factory? get getFactory => _factory;

  factory Config() {
    _instance ??= Config._init();
    return _instance!;
  }
}
