import 'package:flutter/material.dart';
import 'package:super_woman_user/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView(
          children: [
            Request(
              mentorName: 'Eden Getachew',
              date: 'May 12, 2022',
              status: 'Accepted',
              message:
                  'The path provided below has to start and end with a slash in order for'
                  'it to work correctly',
              interest: 'Interest in Software Engineering',
              onMore: () {},
            ),
            Request(
              mentorName: 'Eden Getachew',
              date: 'May 12, 2022',
              status: 'Rejected',
              message:
                  'The path provided below has to start and end with a slash in order for'
                  'it to work correctly',
              interest: 'Interest in Software Engineering',
              onMore: () {},
            ),
            Request(
              mentorName: 'Eden Getachew',
              date: 'May 12, 2022',
              status: 'Rejected',
              message:
                  'The path provided below has to start and end with a slash in order for'
                  'it to work correctly',
              interest: 'Interest in Software Engineering',
              onMore: () {},
            ),
          ],
        ));
  }
}

class Request extends StatelessWidget {
  String mentorName;
  String? date;
  String? status;
  String? interest;
  String? message;
  Function onMore;
  Request({
    required this.mentorName,
    required this.date,
    this.status,
    this.interest,
    this.message,
    required this.onMore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Sent to $mentorName on $date'),
          TextButton(
            onPressed: () {},
            child: Text('$status',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color: status!.toLowerCase() == 'accepted'
                        ? kSecondaryColor
                        : kPrimaryColor)),
          )
        ],
      ),
      Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$interest'),
            const SizedBox(
              height: 5,
            ),
            Text('$message...'),
            TextButton(
              child: const Text(
                'Read more',
                style: TextStyle(
                    color: kSecondaryColor, fontWeight: FontWeight.bold),
              ),
              onPressed: onMore(),
            ),
          ],
        ),
      )
    ]);
  }
}
