import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Constants/text_strings.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../src/Theme/colors.dart';
import '../../../src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';
import '../../../src/Utils/CommonWidgets/UserFloatingactionButton.dart';


class FirstAidVideo extends StatelessWidget {
  final List<String> videoUrls = [
    'https://youtu.be/KiWn4thXAI8',
    'https://youtu.be/Plse2FOkV4Q',
    'https://youtu.be/z_5tuB1YMK0',
    'https://youtu.be/2v8vlXgGXwE',
    'https://youtu.be/4e7evinsfm0',
  ];
  List<String> videoTitles = [
    'First Aid Basics',
    'CPR Techniques',
    'Dealing with Burns',
    'Handling Fractures',
    'Treating Cuts & Wounds',
  ];
  List<String> videoThumbnales = [
    'assets/Images/First Aid Guide/First Aid Basic.jpg',
    'assets/Images/First Aid Guide/CPR Techniques.jpg',
    'assets/Images/First Aid Guide/Dealing with Burns.jpg',
    'assets/Images/First Aid Guide/Fracture.jpg',
    'assets/Images/First Aid Guide/Treat Cuts.jpg',
  ];
  List<String> videoDescription = [
    firstAidBasic,
    cprTechnique,
    dealingWithBurns,
    handlingFractures,
    treatingWounds,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButtonWithNotched(),
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
          SizedBox(height: 20,),
          Container(
            child: Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
              itemCount: videoUrls.length,
              // itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {

                return Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                  child: InkWell(
                    onTap: (){
                      Get.to(VideoPlayerPage(videoUrl: videoUrls[index], videoTitle:  videoTitles[index], description:videoDescription[index] ,));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.asset(
                              videoThumbnales[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 175),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(VideoPlayerPage(videoUrl: videoUrls[index], videoTitle:  videoTitles[index],description:videoDescription[index] ));
                              },
                              style: ElevatedButton.styleFrom(primary: secondaryColor),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  videoTitles[index].toUpperCase(),
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                );
              },
        ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;
  final String description;

  VideoPlayerPage({required this.videoUrl,required this.videoTitle, required this.description });

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
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white) ),
        backgroundColor: primaryColor,
        title: Text(widget.videoTitle, textAlign: TextAlign.center,),
      ),

      body: SingleChildScrollView(
        child: YoutubePlayerBuilder(
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
                  padding: const EdgeInsets.all(20.0),
                  child: Text(widget.description),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}