
import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();

}

class _StopWatchState extends State<StopWatch> {

  late Stream<int>? timerStream;
  late StreamSubscription timerSubscription;

  String hoursStr = "00";
  String minutesStr = "00";
  String secondsStr = "00";

  bool isStart = false;

  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[
               Text(
                  "$hoursStr:$minutesStr:$secondsStr",
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.timer,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      if(isStart) {
                        timerSubscription.cancel();
                        timerStream = null;
                      }
                      isStart=true;
                      timerStream = stopWatchStream();
                      timerSubscription = timerStream?.listen((int newTick) {
                        setState(() {
                          hoursStr = ((newTick / (60 * 60)) % 60)
                              .floor()
                              .toString()
                              .padLeft(2, '0');
                          minutesStr = ((newTick / 60) % 60)
                              .floor()
                              .toString()
                              .padLeft(2, '0');
                          secondsStr =
                              (newTick % 60).floor().toString().padLeft(2, '0');
                        });
                      }) as StreamSubscription;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      timerSubscription.resume();
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.stop,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      timerSubscription.pause();
                    });
                  },
                ),
            ],
          ),
      );
  }

  Stream<int> stopWatchStream() {
    StreamController<int> streamController = StreamController<int>();;
    Timer? timer;
    Duration timerInterval = const Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer?.cancel();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

}

