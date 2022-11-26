import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_config_plus/flutter_config_plus.dart';
import 'package:flutter_config_plus/flutter_config_plus_platform_interface.dart';
import 'package:flutter_config_plus/flutter_config_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterConfigPlusPlatform
    with MockPlatformInterfaceMixin
    implements FlutterConfigPlusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterConfigPlusPlatform initialPlatform = FlutterConfigPlusPlatform.instance;

  test('$MethodChannelFlutterConfigPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterConfigPlus>());
  });

  test('getPlatformVersion', () async {
    /*FlutterConfigPlus flutterConfigPlusPlugin = FlutterConfigPlus();
    MockFlutterConfigPlusPlatform fakePlatform = MockFlutterConfigPlusPlatform();
    FlutterConfigPlusPlatform.instance = fakePlatform;

    expect(await flutterConfigPlusPlugin.getPlatformVersion(), '42');*/
  });
}
