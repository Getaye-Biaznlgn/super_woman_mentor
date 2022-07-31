import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/models/experience.dart';
import 'package:super_woman_user/providers/themes.dart';

class MentorExperience extends StatelessWidget {
  List<Experience> experiences;
  MentorExperience({required this.experiences, Key? key}) : super(key: key);
  
  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            experiences.length,
            (index) => ExperienceItem(
                title: experiences[index].position,
                org: experiences[index].organization,
                date: _formatDate(experiences[index].from) +
                    '-' +
                    _formatDate(experiences[index].to))),
      ),
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
