import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class FirstAidVideo extends StatefulWidget {
  @override
  _FirstAidVideoState createState() => _FirstAidVideoState();
}

class _FirstAidVideoState extends State<FirstAidVideo> {
  late List<VideoPlayerController> _videoControllers;
  late List<ChewieController> _chewieControllers;

  @override
  void initState() {
    super.initState();
    // Initialize video controllers
    _videoControllers = [
      VideoPlayerController.network('https://www.youtube.com/watch?v=hizBdM1Ob68'),
      VideoPlayerController.network('https://www.youtube.com/watch?v=CYdYnMmmcWc'),
      VideoPlayerController.network('https://www.youtube.com/watch?v=RxgZJA625QQ'),
    ];

    // Initialize chewie controllers
    _chewieControllers = _videoControllers.map((controller) {
      return ChewieController(
        videoPlayerController: controller,
        autoPlay: false,
        looping: false,
        // Other ChewieController configurations
      );
    }).toList();
  }

  @override
  void dispose() {
    // Dispose of video and chewie controllers
    for (var chewieController in _chewieControllers) {
      chewieController.dispose();
    }
    for (var videoController in _videoControllers) {
      videoController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Videos'),
      ),
      body: ListView.builder(
        itemCount: _chewieControllers.length,
        itemBuilder: (context, index) {
          return Chewie(
            controller: _chewieControllers[index],
          );
        },
      ),
    );
  }
}