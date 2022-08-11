import 'package:chewie/chewie.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/fonts_style.dart';
import 'package:firemax_football/routes/route_constant.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class FramePlay extends StatefulWidget {
  final String? urlVideo;
  const FramePlay({Key? key,  this.urlVideo}) : super(key: key);

  @override
  State<FramePlay> createState() => _FramePlayState();
}

class _FramePlayState extends State<FramePlay> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  bool? isInitialized = false;

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
    );
    videoPlayerController!.addListener(() {
      if (videoPlayerController!.value.hasError) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("OFFLINE", style: xFontH1),
                content: Text(
                  "The match is over, please refresh the home page to load the latest match",
                  style: xFontP,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Back", style: xFontP),
                  ),
                  BlocBuilder<ValidationBloc, ValidationState>(
                    builder: (context, state) {
                      if (state is ValidationLoaded) {
                        return ElevatedButton(
                          onPressed: () {
                            GoRoute.pushReplace(
                                context: context,
                                routeName: xRouteVaValidation,
                                modelValidation: state.modelValidation);
                          },
                          style:
                              ElevatedButton.styleFrom(primary: xColorVariant),
                          child: Text(
                            "Go Home",
                            style: xFontP,
                          ),
                        );
                      }
                      return Container();
                    },
                  )
                ],
              );
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
      return const Center(
        child: CustomLoading(
          color: xColorMain,
        ),
      );
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
