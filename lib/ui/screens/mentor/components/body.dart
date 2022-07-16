import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/providers/themes.dart';
import 'package:super_woman_user/ui/screens/mentor/mentor_detail.dart';
import 'package:super_woman_user/utils/constants.dart';
import 'search_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
      Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        child: SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              MentorFilterItem(
                field: 'Physician',
                onPress: () {},
              ),
              MentorFilterItem(
                field: 'Musician',
                onPress: () {},
              ),
              MentorFilterItem(
                field: 'Athlet',
                onPress: () {},
              ),
              MentorFilterItem(
                field: 'Programmer',
                onPress: () {},
              ),
              MentorFilterItem(
                field: 'Model',
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: kDefaultPadding / 2,
      ),
      Expanded(
          child: ListView(
        children: [
          MentorListItem(
            name: 'Eden Getachew',
            field: 'Project Manager, Google',
            noOfMentee: 2,
            onPress: () {
              Navigator.pushNamed(context, MentorDetail.routeName);
            },
          ),
          MentorListItem(
            name: 'Zemene Alula',
            field: 'Coder, Zumba',
            noOfMentee: 10,
            onPress: () {
              Navigator.pushNamed(context, MentorDetail.routeName);
            },
          ),
          MentorListItem(
            name: 'Alula Abanega',
            field: 'Coder, Zumba',
            noOfMentee: 10,
            onPress: () {
              Navigator.pushNamed(context, MentorDetail.routeName);
            },
          ),
        ],
      ))
    ]);
  }
}

class MentorListItem extends StatelessWidget {
  String name;
  String field;
  int noOfMentee;
   final VoidCallback  onPress;
  MentorListItem({
    required this.name,
    required this.field,
    required this.noOfMentee,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: kPrimaryColor,
        child: Text(
          name.substring(0, 1).toUpperCase(),
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
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

class MentorFilterItem extends StatelessWidget {
  String field;
   final VoidCallback  onPress;
  MentorFilterItem({
    required this.field,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(right: kDefaultPadding / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: kSecondaryColor),
        child: Center(
            child: Text(
          field,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
