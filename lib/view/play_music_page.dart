import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:flutter/material.dart';
import 'package:music_apps/constants/colors.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPage extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;
  const MusicPage(
      {super.key,
      required this.title,
      required this.description,
      required this.color,
      required this.img,
      required this.songUrl});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  double _currentSliderValue = 20;

  // audio player here
  late AudioPlayer advancedPlayer;
  bool isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  initPlayer() {
    advancedPlayer = new AudioPlayer();
    playSound(widget.songUrl);
  }

  playSound(localPath) async {
    await advancedPlayer.play(localPath);
  }

  stopSound(localPath) async {
    advancedPlayer.stop();
  }

  seekSound() async {
    advancedPlayer.seek(Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stopSound(widget.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  getAppbar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.add_alarm,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 100,
                  height: size.width - 100,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: widget.color,
                        blurRadius: 50,
                        spreadRadius: 5,
                        offset: Offset(-10, 40))
                  ], borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 60,
                  height: size.width - 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: size.width - 80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.abc,
                    color: Colors.white,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.starterWhite),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          widget.description,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.5)),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.abc,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Slider(
              activeColor: ColorConstants.primaryColor,
              value: _currentSliderValue,
              min: 0,
              max: 200,
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
              }),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1:50",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                Text(
                  "4:50",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    FeatherIcons.shuffle,
                    color: ColorConstants.starterWhite.withOpacity(0.8),
                    size: 25,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    FeatherIcons.skipBack,
                    color: ColorConstants.starterWhite.withOpacity(0.8),
                    size: 25,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.primaryColor),
                    child: Center(
                      child: Icon(
                        FeatherIcons.stopCircle,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    FeatherIcons.skipForward,
                    color: ColorConstants.starterWhite.withOpacity(0.8),
                    size: 25,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    FeatherIcons.repeat,
                    color: ColorConstants.starterWhite.withOpacity(0.8),
                    size: 25,
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
