import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../models/role_model_detail.dart';
// import 'components/player_card.dart';

class AudioPlayPage extends StatelessWidget {
  static const String routeName = "/audio-play-page";
  AudioPlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoleModelDetail roleModel =
        ModalRoute.of(context)!.settings.arguments as RoleModelDetail;

    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 200.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('SliverAppBar'),
              background: Container(
                  child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(roleModel.images![0]),
                placeholder: const AssetImage('assets/images/logo.png'),
              )),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              roleModel.title,
              textAlign: TextAlign.center,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: PlayerWidget(audioPath: roleModel.audioPath ?? ''),
            ),
          )
        ],
      ),
    ));
  }
}

class PlayerWidget extends StatefulWidget {
  String audioPath;
  PlayerWidget({required this.audioPath, Key? key}) : super(key: key);

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  final audioPlayer = AudioPlayer();
  String url = 'http://192.168.0.8:8000/rolemodelaudios/hfYqU1659946772.mp3';
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
    // await audioPlayer.setSourceUrl(widget.audioPath);
    await audioPlayer.play(UrlSource(widget.audioPath));
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formatDuration(position)),
            Text(formatDuration(duration))
          ],
        ),
        CircleAvatar(
            child: IconButton(
                onPressed: () {
                  if (isPlaying) {
                    audioPlayer.resume();
                  } else {
                    audioPlayer.pause();
                  }
                },
                icon: isPlaying
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_circle)))
      ],
    );
  }
}
