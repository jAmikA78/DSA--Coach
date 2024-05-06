import 'dart:async';

import 'package:dsa_coach/const/data.dart';
import 'package:flutter/material.dart';

class SolvingView extends StatefulWidget {
  final String title;
  final String tutorial;
  const SolvingView({required this.title, super.key, required this.tutorial});

  @override
  State<SolvingView> createState() => _SolvingViewState();
}

class _SolvingViewState extends State<SolvingView> {
  final Stopwatch _stopwatch = Stopwatch();
  late Duration _elapsedTime;
  String _elapsedTimeString = "00:00.00";
  late Timer timer;
  String state = "Thinking now !!";
  int cnt = 0, nOfWrongs = 0;
  late Duration thinkingTime, solvingTime;
  @override
  void initState() {
    super.initState();

    _elapsedTime = Duration.zero;
    _elapsedTimeString = _formatElapsedTime(_elapsedTime);

    // Create a timer that runs a callback every 100 milliseconds to update UI
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        // Update elapsed time only if the stopwatch is running
        if (_stopwatch.isRunning) {
          _updateElapsedTime();
        }
      });
    });
  }

  // Start/Stop button callback
  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      // Start the stopwatch and update elapsed time
      _stopwatch.start();
      _updateElapsedTime();
    } else {
      // Stop the stopwatch
      _stopwatch.stop();
    }
  }

  // Reset button callback
  void _resetStopwatch() {
    // Reset the stopwatch to zero and update elapsed time

    setState(
      () {
        if (cnt == 0) {
          solvingTime = _stopwatch.elapsed;
          cnt = 1;
          state = "Solving now !!";
          _stopwatch.reset();
          _updateElapsedTime();
        } else if (cnt == 1) {
          thinkingTime = _stopwatch.elapsed;
          problemsTimes.add(
            {
              nOfWrongs: {thinkingTime: solvingTime}
            },
          );
          Navigator.pop(context);
        }
      },
    );
  }

  void _updateElapsedTime() {
    setState(() {
      _elapsedTime = _stopwatch.elapsed;
      _elapsedTimeString = _formatElapsedTime(_elapsedTime);
    });
  }

  String _formatElapsedTime(Duration time) {
    return '${time.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(time.inSeconds.remainder(60)).toString().padLeft(2, '0')}.${(time.inMilliseconds % 1000 ~/ 100).toString()}';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(state, style: TextStyle(fontSize: fontSz - 5)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _elapsedTimeString,
                style: TextStyle(fontSize: fontSz + 10),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _startStopwatch,
                    child: Text(
                      _stopwatch.isRunning ? 'Stop' : 'Start',
                      style: TextStyle(fontSize: fontSz),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: _resetStopwatch,
                    child: Text(
                      (cnt == 0 ? 'Next' : 'Finish'),
                      style: TextStyle(fontSize: fontSz),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                nOfWrongs.toString() + (nOfWrongs == 1 ? " wrong" : " wrongs"),
                style: TextStyle(fontSize: fontSz),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      nOfWrongs++;
                    });
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    iconSize: fontSz,
                  ),
                  icon: const Icon(Icons.plus_one))
            ],
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Tutorial!'),
                    content: Text(widget.tutorial),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.primary),
              child: Text(
                "Tutorial",
                style: TextStyle(
                    fontSize: fontSz - 5,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
