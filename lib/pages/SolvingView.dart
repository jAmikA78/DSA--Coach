import 'dart:async';

import 'package:dsa_coach/const/data.dart';
import 'package:flutter/material.dart';

class SolvingView extends StatefulWidget {
  final String title;
  const SolvingView({required this.title, super.key});

  @override
  State<SolvingView> createState() => _SolvingViewState();
}

class _SolvingViewState extends State<SolvingView> {
  final Stopwatch _stopwatch = Stopwatch();
  late Duration _elapsedTime;
  String _elapsedTimeString = "00:00.00";
  late Timer timer;

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
    _stopwatch.reset();
    _updateElapsedTime();
  }

  // Update elapsed time and formatted time string
  void _updateElapsedTime() {
    setState(() {
      _elapsedTime = _stopwatch.elapsed;
      _elapsedTimeString = _formatElapsedTime(_elapsedTime);
    });
  }

  // Format a Duration into a string (MM:SS.SS)
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
    String state = "Thinking now !!";
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
              // Display elapsed time
              Text(
                _elapsedTimeString,
                style: TextStyle(fontSize: fontSz + 10),
              ),
              const SizedBox(height: 20.0),
              // Start/Stop and Reset buttons
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
                      'Next',
                      style: TextStyle(fontSize: fontSz),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
