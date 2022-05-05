/*
BASED ON EXAMPLE PROVIDED BY Sarbagya Dhaubanjar
https://github.com/sarbagyastha/youtube_player_flutter
 */
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  final List<YoutubePlayerController> _controllers =
      ['lVeNTofDB2k', 'vQVTNscQY0c', '6yItCQB4V9A', 't8eYs2vxT-8']
          .map<YoutubePlayerController>(
            (videoId) => YoutubePlayerController(
              initialVideoId: videoId,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
              ),
            ),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(24),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Material(
              elevation: 3,
              child: YoutubePlayer(
                key: ObjectKey(_controllers[index]),
                controller: _controllers[index],
                actionsPadding: const EdgeInsets.only(left: 16.0),
                showVideoProgressIndicator: true,
                bottomActions: [
                  CurrentPosition(),
                  const SizedBox(width: 10.0),
                  ProgressBar(isExpanded: true),
                  const SizedBox(width: 10.0),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
              ),
            ),
          ],
        );
      },
      itemCount: _controllers.length,
      separatorBuilder: (context, _) => const SizedBox(height: 32.0),
    );
  }
}
