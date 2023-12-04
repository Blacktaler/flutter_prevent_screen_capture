import Flutter
import UIKit

enum ChannelName {
    static let eventChannel = "blacktaler.uz/screenCaptureEvent"
    static let methodChannel = "blacktaler.uz/screenCaptureMethod"
}


public class FlutterPreventScreenCapturePlugin: NSObject, FlutterPlugin,FlutterStreamHandler {

    
    private var eventSink: FlutterEventSink?;
    public static func register(with registrar: FlutterPluginRegistrar) {
        let methodChannel = FlutterMethodChannel(name: ChannelName.methodChannel, binaryMessenger: registrar.messenger())
        let eventChannel = FlutterEventChannel(name: ChannelName.eventChannel, binaryMessenger: registrar.messenger())
        let instance = FlutterPreventScreenCapturePlugin()
        
        eventChannel.setStreamHandler(instance)
        
        registrar.addMethodCallDelegate(instance, channel: methodChannel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "checkRecording":
          receiveRecordingStatus(result: result)
      default:
          result(FlutterMethodNotImplemented)
        }
    }
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        
        NotificationCenter.default.addObserver(self, selector: #selector(sendRecordingStateEvent), name: UIScreen.capturedDidChangeNotification, object: nil)
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        NotificationCenter.default.removeObserver(self)
        eventSink = nil
        return nil
    }
    
    private func receiveRecordingStatus(result:FlutterResult){
        result(Bool(UIScreen.main.isCaptured))
    }
    
    @objc private func sendRecordingStateEvent(){
        guard let eventSink = eventSink else{
            return
        }
        
        if UIScreen.main.isCaptured{
            eventSink("true")
        } else {
            eventSink("false")
        }
        
    }
    
}
