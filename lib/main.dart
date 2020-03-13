import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:nucard/screens/my_cards.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(BatteryHome());
}

class NuCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NuCard',
      theme: ThemeData.light(),
      home: MyCards(),
    );
  }
}

class BatteryHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBatteryHomeState();
  }
}

class MyBatteryHomeState extends State<BatteryHome> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text('Qual a porcentagem de bateria?')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                RaisedButton(
                  child: Text('Get Battery Level'),
                  onPressed: _getBatteryLevel,
                ),
                Text(_batteryLevel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
