import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_config_plus_method_channel.dart';

abstract class FlutterConfigPlusPlatform extends PlatformInterface {
  /// Constructs a FlutterConfigPlusPlatform.
  FlutterConfigPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterConfigPlusPlatform _instance = MethodChannelFlutterConfigPlus.instance;

  /// The default instance of [FlutterConfigPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterConfigPlus].
  static FlutterConfigPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterConfigPlusPlatform] when
  /// they register themselves.
  static set instance(FlutterConfigPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
