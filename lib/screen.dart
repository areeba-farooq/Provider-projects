import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ScreenPlayer extends StatefulWidget {
  const ScreenPlayer({Key? key}) : super(key: key);

  @override
  State<ScreenPlayer> createState() => _ScreenPlayerState();
}

class _ScreenPlayerState extends State<ScreenPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-pet-owner-playing-with-a-cute-cat-1779-large.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: const Text("Video Player")),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: const VideoProgressColors(
                backgroundColor: Colors.black,
                bufferedColor: Colors.grey,
                playedColor: Colors.blueAccent),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
