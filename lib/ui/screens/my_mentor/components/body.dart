import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/models/experience.dart';
import 'package:super_woman_user/ui/screens/chat/chat_screen.dart';
import 'package:super_woman_user/utils/constants.dart';

import '../../../../models/mentor.dart';
import '../../../../providers/auth.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  MentorLists mentorList = MentorLists();

  Experience? _currentExprience(List<Experience> list) {
    int index = list.indexWhere((element) => element.isCurrent == 0);

    if (index == -1) return null;

    return list[index];
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: FutureBuilder(
          future: mentorList.fetchMyMentor(auth.token),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Faild to load data'),
                );
              } else if (snapshot.hasData) {
                Mentor mentor = snapshot.data as Mentor;
                Experience? experience = _currentExprience(mentor.experiences!);
                return Column(
                  children: [
                    ListTile(
                      isThreeLine: true,
                      leading: mentor.profilePicture == null
                          ? CircleAvatar(
                              radius: 30,
                              backgroundColor: kPrimaryColor,
                              child: Text(
                                mentor.firstName.substring(0, 1).toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(mentor.profilePicture!),
                            ),
                      title: Text('${mentor.firstName} ${mentor.lastName}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          '${experience?.position ?? ""}, ${experience?.organization ?? ""}\n${mentor.noOfMentee} Mentee'),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Disconnect',
                            style: TextStyle(color: kSecondaryColor),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ChatScreen.routeName);
                          },
                          child: const Text(
                            'Send Message',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                          ),
                        )
                      ],
                    )
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
