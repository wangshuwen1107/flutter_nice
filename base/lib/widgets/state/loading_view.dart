import 'package:flutter/material.dart';
import 'package:base/anim/delay_tween.dart';

class LoadingView extends StatefulWidget {
  final Color color;

  final double size;

  final Duration duration;

  LoadingView(
      {this.color = Colors.grey,
      this.size = 10.0,
      this.duration = const Duration(milliseconds: 800)});

  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with SingleTickerProviderStateMixin {
  static const dotSize = 3;

  AnimationController controller;
  Animation<Color> colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat();
    colorAnimation = ColorTween(begin: Colors.grey, end: Colors.transparent)
        .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox.fromSize(
      size: Size(widget.size * 3 + 10, widget.size),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(dotSize, (i) {
            return ScaleTransition(
              scale: DelayTween(begin: 0.0, end: 1.0, delay: i * .2)
                  .animate(controller),
              child: SizedBox.fromSize(
                  size: Size.square(widget.size),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: colorAnimation.value,
                          shape: BoxShape.circle))),
            );
          })),
    ));
  }
}
