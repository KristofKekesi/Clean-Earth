import 'package:cleanearth/widgets/splash.dart';
import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/59538721/flutter-countdown-timer-that-displays-minutes-and-seconds

// ignore: must_be_immutable
class CountdownTimerAnimation extends AnimatedWidget {
  final BuildContext popupContext;

  CountdownTimerAnimation({ Key key, this.animation, this.popupContext }) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context){

    Duration clockTimer = Duration(seconds: animation.value);

    String timerText = '${clockTimer.inMinutes.remainder(60).toString()}:${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';

    return Text(
      "$timerText",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        fontSize:
        MediaQuery.of(context).size.height * .08,
      ),
    );
  }
}

class Countdown extends StatefulWidget {
  final String countdownName;
  final BuildContext popupContext;

  const Countdown({Key key, this.countdownName, this.popupContext}) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState(countdownName, popupContext);
}

class _CountdownState extends State<Countdown> with SingleTickerProviderStateMixin {
  final String countdownName;
  final BuildContext popupContext;

  AnimationController _countdownController;

  _CountdownState(this.countdownName, this.popupContext);

  @override
  void initState() {
    super.initState();

    Duration duration;
    if (countdownName == "report") {
      duration =  Duration(seconds: reportCooldown);
    } else if (countdownName == "pickup") {
      duration = Duration(seconds: pickupCooldown);
    }

    _countdownController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration:duration,
    );

    _countdownController.forward();
  }

  @override
  void dispose() {
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int begin;
    if (countdownName == "report") {
      begin = nextReport.difference(DateTime.now()).inSeconds;
    } else if (countdownName == "pickup") {
      begin = nextPickup.difference(DateTime.now()).inSeconds;
    }

    return CountdownTimerAnimation(
      popupContext: popupContext,
        animation: StepTween(
          begin: begin, // convert to seconds here
          end: 0,
        ).animate(_countdownController),
      );
    }
}