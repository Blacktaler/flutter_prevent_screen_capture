import 'package:flutter/services.dart';

class FlutterPreventScreenCaptureChannels {
  static const String _eventChannelName = "blacktaler.uz/screenCaptureEvent";
  static const String _methodChannelName = "blacktaler.uz/screenCaptureMethod";

  static const EventChannel eventChannel = EventChannel(_eventChannelName);
  static const MethodChannel methodChannel = MethodChannel(_methodChannelName);
}
