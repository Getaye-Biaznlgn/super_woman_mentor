import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';
import '../../role_model_detail/role_model_detail_screen.dart';

class RoleModelCard extends StatelessWidget {
  int id, like, comment;
  String img, title, intro;

  RoleModelCard({
    required this.id,
    required this.img,
    required this.intro,
    required this.title,
    required this.like,
    required this.comment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoleModelDetail.routeName,
              arguments: id);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      image: NetworkImage(img),
                      placeholder: const AssetImage(
                        'assets/images/logo.png',
                      ),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            const SizedBox(
              width: kDefaultPadding * 1 / 2,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.thumb_up_outlined,
                              size: kBodyMediumTextSize * 0.8,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(like.toString()),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.message,
                              size: kBodyMediumTextSize * 0.8,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(comment.toString())
                          ]),
                    ),
                  ),
                  Text(
                    intro,
                    maxLines: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
