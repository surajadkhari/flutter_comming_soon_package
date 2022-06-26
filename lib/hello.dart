import 'dart:async';

import 'package:flutter/material.dart';

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

//Update the time in 'YYYY-MM-DD HH:MM:SS' format
final eventTime = DateTime.parse('2022-06-26 13:44:00');

class _TimerAppState extends State<TimerApp> {
  static const duration = Duration(seconds: 1);

  int timeDiff = eventTime.difference(DateTime.now()).inSeconds;
  bool isActive = false;

  Timer? timer;

  void handleTick() {
    if (timeDiff > 0) {
      if (isActive) {
        setState(() {
          if (eventTime != DateTime.now()) {
            timeDiff = timeDiff - 1;
          } else {
            print('Times up!');
            //Do something
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    timer ??= Timer.periodic(duration, (Timer t) {
      handleTick();
    });

    int days = timeDiff ~/ (24 * 60 * 60) % 24;
    int hours = timeDiff ~/ (60 * 60) % 24;
    int minutes = (timeDiff ~/ 60) % 60;
    int seconds = timeDiff % 60;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: const Center(
            child: Text('Countdown Timer'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LabelText(
                      label: 'DAYS', value: days.toString().padLeft(2, '0')),
                  LabelText(
                      label: 'HRS', value: hours.toString().padLeft(2, '0')),
                  LabelText(
                      label: 'MIN', value: minutes.toString().padLeft(2, '0')),
                  LabelText(
                      label: 'SEC', value: seconds.toString().padLeft(2, '0')),
                ],
              ),
              const SizedBox(height: 60),
              Container(
                width: 200,
                height: 47,
                margin: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  // color: isActive ? Colors.grey : Colors.green,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(25)),
                  child: Text(isActive ? 'STOP' : 'START'),
                  onPressed: () {
                    setState(() {
                      isActive = !isActive;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
