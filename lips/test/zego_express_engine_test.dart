import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

void main() {
  const MethodChannel channel = MethodChannel('zego_express_engine');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ZegoExpressEngine.getVersion(), '42');
  });
}
