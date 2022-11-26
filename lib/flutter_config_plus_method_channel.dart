import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_config_plus_platform_interface.dart';

/// An implementation of [FlutterConfigPlusPlatform] that uses method channels.
class MethodChannelFlutterConfigPlus extends FlutterConfigPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  static const MethodChannel methodChannel = MethodChannel('flutter_config_plus');
  /// An instance of all environment variables
  late Map<String, dynamic> _variables;

  static final instance = MethodChannelFlutterConfigPlus();

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }


  /// Variables need to be loaded on app startup, recommend to do it `main.dart`
  static loadEnvVariables() async {
    final Map<String, dynamic>? loadedVariables =
    await methodChannel.invokeMapMethod('loadEnvVariables');
    instance._variables = loadedVariables ?? {};
  }

  /// Returns a specific variable value give a [key]
  static dynamic get(String key) {
    var variables = instance._variables;

    if (variables.isEmpty) {
      print(
        'FlutterConfigPlus Variables are Empty\n'
            'Ensure you have a .env file and you\n'
            'have loaded the variables',
      );
    } else if (variables.containsKey(key)) {
      return variables[key];
    } else {
      print(
        'FlutterConfig Value for Key($key) not found\n'
            'Ensure you have it in .env file',
      );
    }
  }

  /// returns all the current loaded variables;
  static Map<String, dynamic> get variables =>
      Map<String, dynamic>.of(instance._variables);

  @visibleForTesting
  static loadValueForTesting(Map<String, dynamic> values) {
    instance._variables = values;
  }
}
