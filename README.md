
# Screen record tracking plugin for flutter

A flutter plugin for ios to listen to and check the screen recording status. 


|Platforms    | iOS   | 
|-------------|-------|
| **Support** | 12.0+ |


### GET STARTED

### Install

Add the `flutter_prevent_screen_capture` plugin to your
[pubspec dependencies](https://pub.dev/packages/flutter_prevent_screen_capture/install).


## Easy to use
### It is possible to either check or listen to the status of screen recording.
```
void initState() {
    ///Though listening to the screen record, it is recommended to check the screen record status on the first launch.
    checkScreenRecord();

    ///Initialize screenRecordSubscription to regularly listen to the changes
    _screenRecordsSubscription =
        preventScreenCapture.screenRecordsIOS.listen(updateRecordStatus);
    super.initState();
}

///Cancel the subscription when the widget is disposed
@override
  dispose() {
    _screenRecordsSubscription.cancel();
    super.dispose();
  }
```

### In order to check the screen recording status once only
```
Future<void> checkScreenRecord() async {
    final recordStatus = await preventScreenCapture.checkScreenRecord();

    debugPrint('Is screen being recorded: $recordStatus');

    isRecording = recordStatus;
    setState(() {});
}
```


### Note
#### It works on real devices only !!


## FAQ

#### Does it work on Android?

Currently this plugin supports only ios.

#### Is it possible to check this with simulator?

No, the plugin works only in real devices!

