import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:auro_shadow_text/auro_shadow_text.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await AuroShadowText.platformVersion;
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

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Auro_Shadow_Text plugin example'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: new ShadowText(
                  'Shadow Text!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  shadowTop: 2.5,
                  shadowLeft: 2.5,
                  opacityStyle: Colors.grey.withOpacity(1.0),
                  softWrap: true,
                  textScaleFactor: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
