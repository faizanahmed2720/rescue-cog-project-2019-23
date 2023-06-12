import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../src/Theme/colors.dart';


class FirstAidVideo extends StatelessWidget {
  final List<String> videoUrls = [
    'https://youtu.be/KiWn4thXAI8',
    'https://youtu.be/Plse2FOkV4Q',
    'https://youtu.be/z_5tuB1YMK0',
    'https://youtu.be/2v8vlXgGXwE',
    'https://youtu.be/4e7evinsfm0',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white) ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Container(
              height: 180,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: primaryColor,
              ),
              child: Text(
                "First Aid\nVideo Guide".toUpperCase(), textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
            itemCount: videoUrls.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              List<String> videoTitles = [
                'First Aid Basics',
                'CPR Techniques',
                'Dealing with Burns',
                'Handling Fractures',
                'Treating Cuts and Wounds',
              ];
              return ListTile(
                title: Text(videoTitles[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => VideoPlayerPage(
                        videoUrl: videoUrls[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  VideoPlayerPage({required this.videoUrl});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void _enterFullScreen() {
  //   _controller.enterFullScreen();
  // }

  void _setPlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
    });
    _controller.setPlaybackRate(speed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Aid Video Guide'),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          onReady: () {
            _isPlayerReady = true;
          },
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // IconButton(
                    //   icon: const Icon(Icons.fullscreen),
                    //   onPressed: _enterFullScreen,
                    // ),
                    DropdownButton<double>(
                      value: _playbackSpeed,
                      onChanged: (double? newValue) {
                        if (newValue != null) {
                          _setPlaybackSpeed(newValue);
                        }
                      },
                      items: const [
                        DropdownMenuItem<double>(
                          value: 0.5,
                          child: Text('0.5x'),
                        ),
                        DropdownMenuItem<double>(
                          value: 1.0,
                          child: Text('1.0x'),
                        ),
                        DropdownMenuItem<double>(
                          value: 1.5,
                          child: Text('1.5x'),
                        ),
                        DropdownMenuItem<double>(
                          value: 2.0,
                          child: Text('2.0x'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}