//. ignore_for_file: use_super_parameters, library_private_types_in_public_api

// ignore_for_file: file_names, use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTVideo extends StatefulWidget {
  final String videoID;
  final String videoTitle;
  final String videoAuthor;
  const YTVideo(
      {Key? key,
      required this.videoID,
      required this.videoTitle,
      required this.videoAuthor})
      : super(key: key);

  @override
  _YTVideoState createState() => _YTVideoState();
}

String getVideoID(String url) {
  url = url.replaceAll("https://www.youtube.com/watch?v=", "");
  url = url.replaceAll("https://m.youtube.com/watch?v=", "");
  url = url.replaceAll("https://youtu.be/", "");
  return url;
}

class _YTVideoState extends State<YTVideo> {
  late YoutubePlayerController _controller;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: getVideoID(widget.videoID),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller.addListener(() {
      if (_controller.value.isFullScreen != isFullScreen) {
        setState(() {
          isFullScreen = _controller.value.isFullScreen;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.videoTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(widget.videoAuthor),
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              liveUIColor: Colors.amber,
              showVideoProgressIndicator: true,
            ),
            builder: (context, player) => Column(
              children: [
                player,
              ],
            ),
            onExitFullScreen: () {
              SystemChrome.setPreferredOrientations(DeviceOrientation.values);
              setState(() {
                isFullScreen = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
