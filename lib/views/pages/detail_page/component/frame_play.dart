import 'package:chewie/chewie.dart'; 
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/constant.dart';  
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart'; 
import 'package:video_player/video_player.dart';

class FramePlay extends StatefulWidget {
  final String? urlVideo;
  const FramePlay({Key? key, this.urlVideo}) : super(key: key);

  @override
  State<FramePlay> createState() => _FramePlayState();
}

class _FramePlayState extends State<FramePlay> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  bool? isInitialized = false;
  bool? isError = false;
  @override
  void initState() {
    super.initState();
    initializeVideoPlayer(widget.urlVideo!);
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: false,
        aspectRatio: 16 / 9,
        looping: true,
        isLive: true,
        showOptions: false);
    videoPlayerController!.addListener(() {
      if (videoPlayerController!.value.hasError) {
        setState(() {
          isError = true;
        });
      }
      if (videoPlayerController!.value.isInitialized) {
        setState(() {
          isInitialized = true;
        });
      }
      if (videoPlayerController!.value.isBuffering) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isInitialized!) {
      return Chewie(controller: chewieController!);
    } else {
      if (isError!) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Constant.xColorLight),
              Text(
                "Sorry, Video Can't Be Played...",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Please Check Another Channel !",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        );
      } else {
        return const Center(
          child: CustomLoading(
            color: xColorMain,
          ),
        );
      }
    }
  }

  Future<void> initializeVideoPlayer(String videoUrl) async {
    videoPlayerController = VideoPlayerController.network(videoUrl);
    await Future.wait([videoPlayerController!.initialize()]);
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }
}
