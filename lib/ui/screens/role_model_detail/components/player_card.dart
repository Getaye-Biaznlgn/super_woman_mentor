// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:flutter/material.dart';
// // import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import '../../../../services/audio_player_manager.dart';

// class AudioPlayerCard extends StatefulWidget {
//   // ignore: use_key_in_widget_constructors
//   const AudioPlayerCard();
//   @override
//   _AudioPlayerCardState createState() => _AudioPlayerCardState();
// }

// class _AudioPlayerCardState extends State<AudioPlayerCard> {
//   late AudioPlayerManager _pageManager;
//   @override
//   void initState() {
//     super.initState();
//     _pageManager = AudioPlayerManager();
//   }

//   @override
//   void dispose() {
//     _pageManager.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 const Expanded(child: SingleChildScrollView(child: Text(""))),
//                 ValueListenableBuilder<ProgressBarState>(
//                   valueListenable: _pageManager.progressNotifier,
//                   builder: (_, value, __) {
//                     // return Text('HELLO');
//                     return ProgressBar(
//                       progress: value.current,
//                       buffered: value.buffered,
//                       total: value.total,
//                       onSeek: _pageManager.seek,
//                     );
//                   },
//                 ),
//                 ValueListenableBuilder<ButtonState>(
//                   valueListenable: _pageManager.buttonNotifier,
//                   builder: (_, value, __) {
//                     switch (value) {
//                       case ButtonState.loading:
//                         return Container(
//                           margin: const EdgeInsets.all(8.0),
//                           width: 32.0,
//                           height: 32.0,
//                           child: CircularProgressIndicator(
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         );
//                       case ButtonState.paused:
//                         return IconButton(
//                           icon: Icon(
//                             Icons.play_arrow,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                           iconSize: 32.0,
//                           onPressed: () {
//                             _pageManager.play();
//                           },
//                         );
//                       case ButtonState.playing:
//                         return IconButton(
//                           icon: Icon(
//                             Icons.pause,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                           iconSize: 32.0,
//                           onPressed: () {
//                             _pageManager.pause();
//                           },
//                         );
//                     }
//                   },
//                 ),
//               ],
//             )));
//   }
// }
