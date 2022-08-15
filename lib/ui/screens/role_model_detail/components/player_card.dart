import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatefulWidget {
  String audioPath;
  PlayerCard({required this.audioPath, Key? key}) : super(key: key);

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  Future setAudio() async {
    try {
      await audioPlayer.setSourceUrl(widget.audioPath);
      Duration dur = await audioPlayer.getDuration() ?? Duration.zero;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDuration(position)),
              Text(formatDuration(duration))
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                iconSize: 25,
                onPressed: () {
                  audioPlayer.seek(const Duration(seconds: 0));
                },
                icon: const Icon(Icons.replay)),
            IconButton(
                iconSize: 30,
                onPressed: () {
                  audioPlayer.seek(position - const Duration(seconds: 10));
                },
                icon: const Icon(Icons.skip_previous)),
            CircleAvatar(
                child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      if (isPlaying) {
                        audioPlayer.pause();
                      } else {
                        audioPlayer.resume();
                      }
                    },
                    icon: isPlaying
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow))),
            IconButton(
                iconSize: 30,
                onPressed: () {
                  audioPlayer.seek(position + const Duration(seconds: 10));
                },
                icon: const Icon(Icons.skip_next)),
          ],
        )
      ],
    );
  }
}
