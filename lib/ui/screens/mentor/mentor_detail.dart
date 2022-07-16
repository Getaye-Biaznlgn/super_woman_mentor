import 'package:flutter/material.dart';
import 'package:super_woman_user/utils/constants.dart';

class MentorDetail extends StatelessWidget {
  static const String routeName = '/mentor-detail';
  MentorDetail({Key? key}) : super(key: key);
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          MentorProfile(
            name: 'Eden Getachew',
            field: 'Project Manager, Google',
            noOfMentee: 2,
          ),
          Row(
            children: [
              Container(
                child: Text(
                  'Experience',
                  style: TextStyle(
                      color:
                          _selectedIndex == 0 ? kPrimaryColor : kSecondaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  'Availiabilty',
                  style: TextStyle(
                      color:
                          _selectedIndex == 1 ? kPrimaryColor : kSecondaryColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                _controller.jumpToPage(0);
                // _controller.animateToPage(2, duration: const Duration(seconds: 1000), curve: Curves.decelerate);
              },
              child: Text('jUBP')),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                _selectedIndex = index;
              },
              children: const <Widget>[
                Center(
                  child: Text('First Page'),
                ),
                Center(
                  child: Text('Second Page'),
                ),
                Center(
                  child: Text('Third Page'),
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}

class MentorProfile extends StatelessWidget {
  String name;
  String field;
  int noOfMentee;
  MentorProfile({
    required this.name,
    required this.field,
    required this.noOfMentee,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        CircleAvatar(
          radius: 36,
          child: Text(
            name.substring(0, 1).toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          backgroundColor: kPrimaryColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(field),
        Text('$noOfMentee Mentee')
      ],
    );
  }
}
