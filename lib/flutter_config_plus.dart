
import 'flutter_config_plus_method_channel.dart';
import 'flutter_config_plus_platform_interface.dart';

class FlutterConfigPlus {

  Future<String?> getPlatformVersion() {
    return FlutterConfigPlusPlatform.instance.getPlatformVersion();
  }


  /// Variables need to be loaded on app startup, recommend to do it `main.dart`
  static loadEnvVariables() async {
    await MethodChannelFlutterConfigPlus.loadEnvVariables();
  }

  /// Returns a specific variable value give a [key]
  static dynamic get(String key) {
    return MethodChannelFlutterConfigPlus.get(key);
  }

  /// returns all the current loaded variables;
  static Map<String, dynamic> get variables => MethodChannelFlutterConfigPlus.variables;
}
