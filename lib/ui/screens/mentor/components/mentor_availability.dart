import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';

class MentorAvailability extends StatelessWidget {
  const MentorAvailability({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(kDefaultPadding),
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('May availiability of this week',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(
                'Sun 10:45 am - 12:00 pm',
                style: TextStyle(color: Colors.white),
              ),
              Text('Sun 10:45 am - 12:00 pm',
                  style: TextStyle(color: Colors.white)),
              Text('Sun 10:45 am - 12:00 pm',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }
}
