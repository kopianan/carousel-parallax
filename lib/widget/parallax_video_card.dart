import 'package:ayana_test/models/card_info_model.dart';
import 'package:ayana_test/parallax_flow_delegate.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ParallaxVideoCard extends StatefulWidget {
  const ParallaxVideoCard({super.key, required this.info});

  final CardInfoModel info;

  @override
  State<ParallaxVideoCard> createState() => _ParallaxVideoCardState();
}

class _ParallaxVideoCardState extends State<ParallaxVideoCard> {
  final GlobalKey _videoKey = GlobalKey();
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.info.imageAsset);
    //this will set configuration for video and will play the video automatically
    _controller
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((value) => setState(() {}))
      ..play();
    super.initState();
  }

  @override
  void dispose() {
    //will dispose video controller.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 6),
              blurRadius: 8)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Flow(
              delegate: ParallaxFlowDelegate(
                scrollable: Scrollable.of(context),
                listItemContext: context,
                backgroundImageKey: _videoKey,
              ),
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(
                    _controller,
                    key: _videoKey,
                  ),
                )
                // Image(
                //   image: AssetImage(
                //     widget.info.imageAsset,
                //   ),
                //   key: _imageKey,
                //   height: double.infinity,
                //   fit: BoxFit.fitHeight,
                // ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.info.title,
                    // "Healing Meditation",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.info.description,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/icons/right_arrow.png',
                    width: 30,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
