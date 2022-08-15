import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/models/mentor.dart';
import 'package:super_woman_user/providers/themes.dart';
import 'package:super_woman_user/ui/screens/mentor/mentor_detail.dart';
import 'package:super_woman_user/utils/constants.dart';
import 'search_field.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  MentorLists mentorLists = MentorLists();
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeNotifier>(context).isDark;
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SearchField(isDark: isDark),
      ),
      const SizedBox(
        height: kDefaultPadding / 2,
      ),
      // MentorFilterList(),
      const SizedBox(
        height: kDefaultPadding / 2,
      ),
      Expanded(
        child: FutureBuilder(
            future: mentorLists.fetchAllMentors(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Faild to load data'),
                  );
                } else if (snapshot.hasData) {
                  List<Mentor> mentors = snapshot.data as List<Mentor>;
                  return ListView.builder(
                    itemCount: mentors.length,
                    itemBuilder: (context, index) => MentorListItem(
                      name: mentors[index].firstName +
                          ' ' +
                          mentors[index].lastName,
                      field: 'Project Manager, Google',
                      ppic: mentors[index].profilePicture,
                      noOfMentee: mentors[index].noOfMentee,
                      onPress: () {
                        Navigator.pushNamed(context, MentorDetail.routeName,
                            arguments: mentors[index]);
                      },
                    ),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      )
    ]);
  }
}


class MentorListItem extends StatelessWidget {
  String name;
  String field;
  int noOfMentee;
  String? ppic;
  final VoidCallback onPress;
  MentorListItem({
    required this.name,
    required this.field,
    required this.noOfMentee,
    required this.onPress,
    this.ppic,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: ppic == null
          ? CircleAvatar(
              radius: 30,
              backgroundColor: kPrimaryColor,
              child: Text(
                name.substring(0, 1).toUpperCase(),
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          : CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(ppic!),
            ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('$field\n$noOfMentee Mentee'),
      onTap: onPress,
    );
  }
}
