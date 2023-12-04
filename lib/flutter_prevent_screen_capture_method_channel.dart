import 'dart:async';
import 'package:flutter_prevent_screen_capture/src/utils.dart';

import 'flutter_prevent_screen_capture_channels.dart';
import 'flutter_prevent_screen_capture_platform_interface.dart';

/// An implementation of [FlutterPreventScreenCapturePlatform] that uses method channels.
class FlutterPreventScreenCaptureMethodChannel
    extends FlutterPreventScreenCapturePlatform {
  /// The method channel used to interact with the native platform.

  final _methodChannel = FlutterPreventScreenCaptureChannels.methodChannel;
  final _eventChannel = FlutterPreventScreenCaptureChannels.eventChannel;

  Stream<bool>? _screenRecordsIOS;
  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await _methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> checkScreenRecord() async {
    final screenRecord = await _methodChannel.invokeMethod('checkRecording');

    return parseScreenRecord(screenRecord.toString());
  }

  @override
  Stream<bool> get screenRecordsIOS {
    _screenRecordsIOS ??= _eventChannel
        .receiveBroadcastStream()
        .map((event) => event.toString())
        .map((event) => parseScreenRecord(event));

    return _screenRecordsIOS!;
  }
}
