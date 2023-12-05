// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:flutter_prevent_screen_capture/flutter_prevent_screen_capture_platform_interface.dart';

/// Control screen: Check or/and listen to the screen record activities.
///
/// NOTE: Works on real devices only
class FlutterPreventScreenCapture {
  ///Constructs singleton instance of [FlutterPreventScreenCapture]
  //
  factory FlutterPreventScreenCapture() {
    _instance ??= FlutterPreventScreenCapture._();
    return _instance!;
  }

  FlutterPreventScreenCapture._();

  static FlutterPreventScreenCapture? _instance;

  static FlutterPreventScreenCapturePlatform get _platform {
    return FlutterPreventScreenCapturePlatform.instance;
  }

  ///Listens the screen recording status.
  ///
  ///Triggered whenever the screen recording status of the device changes.
  Stream<bool> get screenRecordsIOS {
    return _platform.screenRecordsIOS;
  }

  ///Checks if the screen is being recorded or not
  ///Use this to check the screen record of the app.
  ///
  ///Works once only per use.
  ///In order to regularly listen to the status of the screen record,
  ///listen the changes via[screenRecordsIOS]
  Future<bool> checkScreenRecord() async {
    return _platform.checkScreenRecord();
  }
}
