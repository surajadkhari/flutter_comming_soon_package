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
          dataTime: DateTime(2022, 06, 26, 15, 30, 50),
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
      required this.dataTime})
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
            builTimeCard(header: "header")
          ],
        ),
      ),
    );
  }

  Widget builTimeCard({required String header}) {
    return Column(
      children: [
        // Container(
        //   alignment: Alignment.center,
        //   padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        //   margin: const EdgeInsets.symmetric(horizontal: 8),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(widget.boxRadius),
        //       color: Colors.white),
        //   child: Text(time, style: widget.timerStyle),
        // ),
        const SizedBox(
          height: 8,
        ),
        Text(header),
        LiveCountdown(
            animation:
                StepTween(begin: (getTime()), end: 0).animate(_controller))
      ],
    );
  }
}

class LiveCountdown extends AnimatedWidget {
  const LiveCountdown({
    Key? key,
    required this.animation,
  }) : super(key: key, listenable: animation);
  final Animation<int> animation;
  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    var timertext =
        '${clockTimer.inDays.toString()} days:  ${clockTimer.inHours.remainder(24).toString()} hr :${(clockTimer.inMinutes.remainder(60)).toString()} min:'
        '${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')} sec';
    return Text(
      "Time remaining:$timertext",
      style: const TextStyle(color: Colors.white),
    );
  }
}
