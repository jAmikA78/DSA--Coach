// ignore_for_file: file_names

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
  Duration thinkingTime = const Duration(), solvingTime = const Duration();
  @override
  void initState() {
    super.initState();

    _elapsedTime = Duration.zero;
    _elapsedTimeString = _formatElapsedTime(_elapsedTime);

    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        if (_stopwatch.isRunning) {
          _updateElapsedTime();
        }
      });
    });
  }

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _updateElapsedTime();
    } else {
      _stopwatch.stop();
    }
  }

  void _resetStopwatch() {
    setState(
      () {
        if (cnt == 0) {
          thinkingTime = _elapsedTime;
          cnt = 1;
          state = "Coding time!!";
          _stopwatch.reset();
          _updateElapsedTime();
        } else if (cnt == 1) {
          solvingTime = _elapsedTime;
          problemsTimes
              .add(solvedProblemData(nOfWrongs, thinkingTime, solvingTime));
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
          (cnt == 1)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      nOfWrongs.toString() +
                          (nOfWrongs == 1 ? " wrong" : " wrongs"),
                      style: TextStyle(fontSize: fontSz),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            nOfWrongs++;
                          });
                        },
                        style: IconButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          iconSize: fontSz,
                        ),
                        icon: const Icon(Icons.plus_one))
                  ],
                )
              : const SizedBox(height: 25),
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
