import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shorebird_recipes/utils/class.dart';

class CircleIndicator extends StatefulWidget {
  final double percent;
  final Nutrients nutrient;

  const CircleIndicator(
      {super.key, this.percent = 0.5, required this.nutrient});
  @override
  CircleIndicatorState createState() => CircleIndicatorState();
}

class CircleIndicatorState extends State<CircleIndicator>
    with SingleTickerProviderStateMixin {
  double fraction = 0.0;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    var controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    animation = Tween(begin: 0.0, end: widget.percent).animate(controller)
      ..addListener(() {
        setState(() {
          fraction = animation.value;
        });
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: 70,
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.nutrient.name,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  widget.nutrient.weight,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 70,
            height: 70,
            child: CustomPaint(
              foregroundPainter: CirclePainter(fraction),
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  late Paint _paint;
  final double _fraction;

  CirclePainter(this._fraction) {
    _paint = Paint()
      ..color = const Color(0xff8DB646)
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = const Offset(0.0, 0.0) & size;
    canvas.drawArc(rect, -pi / 2, pi * 2 * _fraction, false, _paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
