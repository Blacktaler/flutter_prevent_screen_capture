import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_prevent_screen_capture_method_channel.dart';

abstract class FlutterPreventScreenCapturePlatform extends PlatformInterface {
  /// Constructs a FlutterPreventScreenCapturePlatform.

  FlutterPreventScreenCapturePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPreventScreenCapturePlatform _instance =
      FlutterPreventScreenCaptureMethodChannel();

  /// The default instance of [FlutterPreventScreenCapturePlatform] to use.
  ///
  /// Defaults to [FlutterPreventScreenCaptureMethodChannel].
  static FlutterPreventScreenCapturePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPreventScreenCapturePlatform] when
  /// they register themselves.
  static set instance(FlutterPreventScreenCapturePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<bool> get screenRecordsIOS {
    throw UnimplementedError('get screenRecorsIOS has not been implemented');
  }

  Future<bool> checkScreenRecord() {
    throw UnimplementedError('checkScreenRecord() has not been implemented');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
