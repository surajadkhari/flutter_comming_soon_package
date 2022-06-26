import 'package:flutter/material.dart';

class FlutterComingSoonPackage extends StatelessWidget {
  const FlutterComingSoonPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double sreenH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: FlutterCommingSoonPackageWidget(
          sreenH: sreenH * 1,
          screenW: screenW,
          title: "Dashmix",
          subtitle: "stay tuned,it is comming soons",
          fontTitleSize: 26,
          fontSubtitleSize: 14,
          time: 1,
          boxRadius: 10,
        ),
      ),
    );
  }
}

class FlutterCommingSoonPackageWidget extends StatefulWidget {
  FlutterCommingSoonPackageWidget(
      {Key? key,
      required this.sreenH,
      required this.screenW,
      required this.title,
      required this.subtitle,
      required this.fontTitleSize,
      required this.fontSubtitleSize,
      required this.time,
      required this.boxRadius,
      this.timerStyle = const TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
      this.containerHeight = 0.2,
      this.containeWeight = 0.8,
      this.dataTime = "2022-06-23 12:01:00"})
      : super(key: key);

  final double sreenH;
  final double screenW;
  final String title;
  final String subtitle;
  final double fontTitleSize;
  final double fontSubtitleSize;
  final double boxRadius;
  final TextStyle timerStyle;
  final double containerHeight;
  final double containeWeight;
  int time;
  final String dataTime;

  @override
  State<FlutterCommingSoonPackageWidget> createState() =>
      _FlutterCommingSoonPackageWidgetState();
}

class _FlutterCommingSoonPackageWidgetState
    extends State<FlutterCommingSoonPackageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      height: widget.sreenH * widget.containerHeight,
      width: widget.screenW * widget.containeWeight,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: widget.fontTitleSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.subtitle.toUpperCase(),
                style: TextStyle(fontSize: widget.fontSubtitleSize),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [],
            ),
          ],
        ),
      ),
    );
  }

  Widget builTimeCard({required String time, required String header}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.boxRadius),
              color: Colors.white),
          child: Text(time, style: widget.timerStyle),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(header),
      ],
    );
  }
}
