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
          title: "Comming Soon",
          subtitle: "Stay tuned,it is comming soons",
          fontTitleSize: 26,
          fontSubtitleSize: 14,
          time: 1,
          boxRadius: 10,
          dataTime: DateTime(2022, 06, 27, 24, 30, 50),
          dateStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          daysLable: "Days",
          hourLable: "Hours",
          minutessLable: "Minuites",
          secondLable: "Seconds",
          space: 10,
          lableStyle: const TextStyle(fontWeight: FontWeight.bold),
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
      required this.dataTime,
      required this.dateStyle,
      required this.daysLable,
      required this.hourLable,
      required this.minutessLable,
      required this.secondLable,
      required this.space,
      required this.lableStyle})
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
  final DateTime dataTime;
  final TextStyle dateStyle;
  final String daysLable;
  final String hourLable;
  final String minutessLable;
  final String secondLable;
  final double space;
  final TextStyle lableStyle;
  @override
  State<FlutterCommingSoonPackageWidget> createState() =>
      _FlutterCommingSoonPackageWidgetState();
}

class _FlutterCommingSoonPackageWidgetState
    extends State<FlutterCommingSoonPackageWidget>
    with SingleTickerProviderStateMixin {
  late bool animate;
  late AnimationController _controller;

  int getTime() => widget.dataTime.difference(DateTime.now()).inSeconds + 2;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: getTime()));

    getTime() >= 0 ? animate = false : true;
    _controller.addListener(() {
      if (_controller.isCompleted) {
        setState(() {
          animate = false;
        });
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    if (_controller.isAnimating || _controller.isCompleted) {
      _controller.dispose();
    }
    super.dispose();
  }

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
            LiveCountdown(
              animation:
                  StepTween(begin: (getTime()), end: 0).animate(_controller),
              datestyle: widget.dateStyle,
              daysLable: widget.daysLable,
              hourLable: widget.hourLable,
              minutessLable: widget.minutessLable,
              secondLable: widget.secondLable,
              space: widget.space,
              labletSyle: widget.lableStyle,
            )
            // builTimeCard(header: "header"),
          ],
        ),
      ),
    );
  }
}

class LiveCountdown extends AnimatedWidget {
  const LiveCountdown(
      {Key? key,
      required this.datestyle,
      required this.animation,
      required this.daysLable,
      required this.hourLable,
      required this.minutessLable,
      required this.secondLable,
      required this.space,
      required this.labletSyle})
      : super(key: key, listenable: animation);
  final Animation<int> animation;
  final TextStyle datestyle;
  final String daysLable;
  final String hourLable;
  final String minutessLable;
  final String secondLable;
  final double space;
  final TextStyle labletSyle;
  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String reDays = clockTimer.inDays.toString();
    String reHours = clockTimer.inHours.remainder(24).toString();
    String reMinutes = clockTimer.inMinutes.remainder(60).toString();
    var reSeconds =
        (clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (reDays != 0)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Text(reDays, style: datestyle),
              ),
              SizedBox(
                height: space,
              ),
              Text(daysLable)
            ],
          ),
        if (reHours != 0)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Text(reHours, style: datestyle),
              ),
              SizedBox(
                height: space,
              ),
              Text(hourLable)
            ],
          ),
        if (minutessLable != 0)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Text(
                  reMinutes,
                  style: datestyle,
                ),
              ),
              SizedBox(
                height: space,
              ),
              Text(minutessLable)
            ],
          ),
        if (reSeconds != 0)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Text(
                  reSeconds,
                  style: datestyle,
                ),
              ),
              SizedBox(
                height: space,
              ),
              Text(
                secondLable,
                style: labletSyle,
              )
            ],
          ),
      ],
    );
  }
}
