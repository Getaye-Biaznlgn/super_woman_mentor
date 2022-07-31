import 'package:flutter/material.dart';
import 'package:super_woman_user/models/availablity.dart';
import '../../../../utils/constants.dart';

class MentorAvailability extends StatelessWidget {
  List<Availablity> availability;
  MentorAvailability({
    required this.availability,
    Key? key,
  }) : super(key: key);

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(kDefaultPadding),
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('May availiability of this week',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),

                ...List.generate(
                    availability.length,
                    (index) => Text(
                        '${availability[index].day} ${availability[index].from.hour}:${availability[index].from.minute}-${availability[index].to.hour}:${availability[index].to.minute}',style: TextStyle(color: Colors.white),))

                // Text(
                //   'Sun 10:45 am - 12:00 pm',
                //   ,
                // ),
                // Text('Sun 10:45 am - 12:00 pm',
                //     style: TextStyle(color: Colors.white)),
                // Text('Sun 10:45 am - 12:00 pm',
                //     style: TextStyle(color: Colors.white)),
              ],
            ),
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
