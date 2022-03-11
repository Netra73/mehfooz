
import 'dart:convert';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

class  VideoPage extends StatefulWidget {
  final String mediaUrl;

  const VideoPage({Key? key,required this.mediaUrl});

  @override
  _VideoPageState createState() => _VideoPageState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _VideoPageState extends State<VideoPage> {
  late ScrollController _scrollController;
  late FlickManager flickManager;
  bool isClicked = false;
  bool _topbar = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_topbar) {
          setState(() {
            _topbar = true;
          });
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_topbar) {
          setState(() {
            _topbar = false;
          });
        }
      }
    });
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.mediaUrl),
    );
  }

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: skyblue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child:FlickVideoPlayer(flickManager: flickManager),
            ),
            SizedBox(height: 20,),
            /* Padding(
              padding:EdgeInsets.only(left: 10.0),
              child: Text("Description:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            )*/
          ],
        ),
      ),
    );
  }

}

