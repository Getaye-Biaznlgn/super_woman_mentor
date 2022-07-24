import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/providers/themes.dart';

class MentorExperience extends StatelessWidget {
  const MentorExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExperienceItem(
            title: 'Project Manager', org: 'Hybrid Design', date: '2017-2022'),
        ExperienceItem(
            title: 'Project Manager', org: 'Hybrid Design', date: '2017-2022'),
        ExperienceItem(
            title: 'Project Manager', org: 'Hybrid Design', date: '2017-2022'),
      ],
    );
  }
}

class ExperienceItem extends StatelessWidget {
  String? title, org, date;
  ExperienceItem({
    this.title,
    this.org,
    this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Provider.of<ThemeNotifier>(context).isDark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(org ?? ''),
        const SizedBox(
          height: 10,
        ),
        Text(date ?? ''),
        const SizedBox(
          height: 10,
        ),
         Divider(
          color: isDark ? Colors.white : Colors.black,
        )
      ],
    );
  }
}
