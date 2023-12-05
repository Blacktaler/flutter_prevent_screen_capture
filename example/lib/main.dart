import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_prevent_screen_capture/flutter_prevent_screen_capture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///Define a streamSubscription in order to receive changes
  late StreamSubscription<bool> _screenRecordsSubscription;

  ///Get the instance of plugin for multiple use.
  FlutterPreventScreenCapture preventScreenCapture =
      FlutterPreventScreenCapture();

  ///is Recording is set to false initially.
  bool isRecording = false;

  @override
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

  updateRecordStatus(bool record) {
    isRecording = record;
    setState(() {});
  }

  Future<void> checkScreenRecord() async {
    final recordStatus = await preventScreenCapture.checkScreenRecord();

    debugPrint('Is screen being recorded: $recordStatus');

    isRecording = recordStatus;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen record check example'),
      ),
      body: Center(
        child: Text('isRecording: $isRecording'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await checkScreenRecord();
      }),
    );
  }
}
