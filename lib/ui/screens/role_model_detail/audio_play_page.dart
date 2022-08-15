import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/role_model_detail/components/player_card.dart';
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
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                roleModel.title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: PlayerCard(audioPath: roleModel.audioPath ?? ''),
            ),
          )
        ],
      ),
    ));
  }
}
