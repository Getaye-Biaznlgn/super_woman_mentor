import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/controller/role_model.dart';
import 'package:super_woman_user/models/role_model_detail.dart';
import 'package:super_woman_user/ui/screens/role_model_detail/audio_play_page.dart';
import 'package:super_woman_user/ui/screens/role_model_detail/role_model_content.dart';
import 'package:super_woman_user/utils/constants.dart';
import '../../../../models/comment.dart';
import '../../../../providers/auth.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  RoleModelController rmCtrl = RoleModelController();

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: FutureBuilder(
          future: rmCtrl.fetchRoleModel(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Faild to load data'),
                );
              } else if (snapshot.hasData) {
                RoleModelDetail roleModel = snapshot.data as RoleModelDetail;
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Carousel(size: size, images: roleModel.images ?? []),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      roleModel.title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RoleModelContent.routeName, arguments: roleModel);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(FontAwesomeIcons.bookOpenReader,
                                  color: Colors.white),
                              SizedBox(
                                width: 5,
                              ),
                              Text('START READING',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kSecondaryColor,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AudioPlayPage.routeName, arguments: roleModel);
                          },
                          child: Row(
                            children: const [
                              Icon(
                                FontAwesomeIcons.play,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('LISTEN AUDIO',
                                
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.download_for_offline_outlined,
                              size: 32,
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding / 2),
                      child: Text(roleModel.intro),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.thumb_up,
                              size: 20,
                            )),
                        Text(
                          roleModel.like.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.solidComment,
                              size: 20,
                            )),
                        Text(
                          roleModel.comment.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.linkedin)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.facebook)),
                      ],
                    ),
                    const Divider(
                      color: kPrimaryColor,
                    ),
                    CommentComponent(comments: roleModel.comments ?? [])
                  ],
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.size,
    required this.images,
  }) : super(key: key);

  final Size size;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) => Container(
              height: size.height * 0.25,
              width: size.width * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  image: NetworkImage(
                    images[index],
                  ),
                  placeholder: const AssetImage('assets/images/r1.jpg'),
                  fit: BoxFit.cover,
                ),
              ))),
    );
  }
}

class CommentComponent extends StatelessWidget {
  List<Comment> comments;
  CommentComponent({
    required this.comments,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'COMMENTS',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(auth.profilePicture),
              ),
              const SizedBox(
                width: 5,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                  ),
                ),
              )
            ],
          ),
          if (comments.isEmpty) const Text('No comment'),
          ...List.generate(
            comments.length,
            (index) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(comments[index].profileImage),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(child: Text(comments[index].content))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
