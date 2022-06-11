import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home1 extends StatefulWidget {
  File? sub1;
  Home1({
    required this.sub1,
  });
  @override
  State<Home1> createState() => _Home1State(sub1: sub1);
}

class _Home1State extends State<Home1> {
  File? sub1;
  _Home1State({
    required this.sub1,
  });
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(sub1!)
      ..initialize().then((_) {
        setState(() {});
      });

    // _controller = VideoPlayerController.network(
    //   'https://firebasestorage.googleapis.com/v0/b/webook-f9ace.appspot.com/o/Webfun%20Introduction%20(1080p).mp4?alt=media&token=62649bae-6a4f-4b6f-a163-57d5c279dd8b',
    // )..initialize().then((_) {
    //     setState(() {});
    //   });
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
    );
    return Scaffold(
      body: Center(
        child: _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                ),
              )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
