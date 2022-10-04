import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:call_flutter_plugin/call_flutter_plugin.dart';
import 'package:call_flutter_plugin/callkit/utils/sip_event.dart';
import 'package:call_flutter_plugin/callkit/utils/transport_type.dart';
import 'package:call_flutter_plugin/graph/extensions/extensions.dart';
import 'package:call_flutter_plugin/callkit/model/sip_configuration.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  void testCallKit() {
    var sipConfiguration = SipConfigurationBuilder(
            extension: "extension", domain: "domain", password: "password")
        .setKeepAlive(true)
        .setPort(5060)
        .setTransport(TransportType.Udp)
        .build();
    CallFlutterPlugin.callModule.initSipModule(sipConfiguration);
    CallFlutterPlugin.callModule.eventStreamController.stream.listen((event) {
      switch (event['event']) {
        case SipEvent.AccountRegistrationStateChanged:
          {
            var body = event['body'];
            print("AccountRegistrationStateChanged");
            print(body);
          }
          break;
        case SipEvent.Ring:
          {
            var body = event['body'];
            print("Ring");
            print(body);
          }
          break;
        case SipEvent.Up:
          {
            var body = event['body'];
            print("Up");
            print(body);
          }
          break;
        case SipEvent.Hangup:
          {
            var body = event['body'];
            print("Hangup");
            print(body);
          }
          break;
        case SipEvent.Paused:
          {
            print("Paused");
          }
          break;
        case SipEvent.Resuming:
          {
            print("Resuming");
          }
          break;
        case SipEvent.Missed:
          {
            var body = event['body'];
            print("Missed");
            print(body);
          }
          break;
        case SipEvent.Error:
          {
            var body = event['body'];
            print("Error");
            print(body);
          }
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
    initPlatformState();
    testCallKit();
  }

  Future<void> requestPermission() async {
    await Permission.microphone.request();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await CallFlutterPlugin.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void call(String phoneNumber) {
    CallFlutterPlugin.callModule
        .call(phoneNumber)
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void hangup() {
    CallFlutterPlugin.callModule
        .hangup()
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void answer() {
    CallFlutterPlugin.callModule.answer().then(
        (value) => {print(value.toString())},
        onError: (error) => {print(error)});
  }

  void reject() {
    CallFlutterPlugin.callModule
        .reject()
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void pause() {
    CallFlutterPlugin.callModule
        .pause()
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void resume() {
    CallFlutterPlugin.callModule.resume().then(
        (value) => {print(value.toString())},
        onError: (error) => {print(error)});
  }

  void transfer(String extension) {
    CallFlutterPlugin.callModule.transfer(extension).then(
        (value) => {print(value.toString())},
        onError: (error) => {print(error)});
  }

  void toggleMic() {
    CallFlutterPlugin.callModule
        .toggleMic()
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void toggleSpeaker() {
    CallFlutterPlugin.callModule
        .toggleSpeaker()
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void getMissedCalls() {
    CallFlutterPlugin.callModule
        .getMissedCalls()
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void getRegistrationState() {
    CallFlutterPlugin.callModule
        .getSipRegistrationState()
        .then((value) => {print(value)}, onError: (error) {
      print(error);
    });
  }

  void isMicEnabled() {
    CallFlutterPlugin.callModule.isMicEnabled().then((value) => print(value));
  }

  void isSpeakerEnabled() {
    CallFlutterPlugin.callModule
        .isSpeakerEnabled()
        .then((value) => print(value));
  }

  void getCallId() {
    CallFlutterPlugin.callModule
        .getCallId()
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void sendDTMF(String dtmf) {
    CallFlutterPlugin.callModule
        .sendDTMF(dtmf)
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void refreshSipAccount() {
    CallFlutterPlugin.callModule
        .refreshSipAccount()
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  void unregisterSipAccount() {
    CallFlutterPlugin.callModule
        .unregisterSipAccount()
        .then((value) => {print(value)}, onError: (error) => {print(error)});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Running on: $_platformVersion\n')),
                OutlinedButton(
                  child: const Text('Call'),
                  onPressed: () {
                    call("phoneNumber");
                  },
                ),
                OutlinedButton(
                  child: const Text('Hangup'),
                  onPressed: () {
                    hangup();
                  },
                ),
                OutlinedButton(
                  child: const Text('Answer'),
                  onPressed: () {
                    answer();
                  },
                ),
                OutlinedButton(
                  child: const Text('Reject'),
                  onPressed: () {
                    reject();
                  },
                ),
                OutlinedButton(
                  child: const Text('Pause'),
                  onPressed: () {
                    pause();
                  },
                ),
                OutlinedButton(
                  child: const Text('Resume'),
                  onPressed: () {
                    resume();
                  },
                ),
                OutlinedButton(
                  child: const Text('Transfer'),
                  onPressed: () {
                    transfer("extension");
                  },
                ),
                OutlinedButton(
                  child: const Text('Toggle mic'),
                  onPressed: () {
                    toggleMic();
                  },
                ),
                OutlinedButton(
                  child: const Text('Toggle speaker'),
                  onPressed: () {
                    toggleSpeaker();
                  },
                ),
                OutlinedButton(
                  child: const Text('Send DTMF'),
                  onPressed: () {
                    sendDTMF("2#");
                  },
                ),
                OutlinedButton(
                  child: const Text('Get call id'),
                  onPressed: () {
                    getCallId();
                  },
                ),
                OutlinedButton(
                  child: const Text('Get missed calls'),
                  onPressed: () {
                    getMissedCalls();
                  },
                ),
                OutlinedButton(
                  child: const Text('Is mic enabled'),
                  onPressed: () {
                    isMicEnabled();
                  },
                ),
                OutlinedButton(
                  child: const Text('Is speaker enabled'),
                  onPressed: () {
                    isSpeakerEnabled();
                  },
                ),
                OutlinedButton(
                  child: const Text('Get registration state'),
                  onPressed: () {
                    getRegistrationState();
                  },
                ),
                OutlinedButton(
                  child: const Text('Refresh sip account'),
                  onPressed: () {
                    refreshSipAccount();
                  },
                ),
                OutlinedButton(
                  child: const Text('Unregister sip account'),
                  onPressed: () {
                    unregisterSipAccount();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    CallFlutterPlugin.callModule.eventStreamController.close();
    super.dispose();
  }
}
