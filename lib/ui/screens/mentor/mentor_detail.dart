import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/mentor/mentor_request_form.dart';
import 'package:super_woman_user/ui/widgets/primary_button.dart';
import 'package:super_woman_user/utils/constants.dart';
import 'components/mentor_availability.dart';
import 'components/mentor_experience.dart';

class MentorDetail extends StatefulWidget {
  static const String routeName = '/mentor-detail';
  MentorDetail({Key? key}) : super(key: key);

  @override
  State<MentorDetail> createState() => _MentorDetailState();
}

class _MentorDetailState extends State<MentorDetail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            MentorProfile(
              name: 'Eden Getachew',
              field: 'Project Manager, Google',
              noOfMentee: 2,
            ),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(0);
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedIndex == 0
                                ? kPrimaryColor
                                : kSecondaryColor,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Experience',
                          style: TextStyle(
                              color: _selectedIndex == 0
                                  ? kPrimaryColor
                                  : kSecondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(1);
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedIndex == 1
                                ? kPrimaryColor
                                : kSecondaryColor,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Availiability',
                          style: TextStyle(
                              color: _selectedIndex == 1
                                  ? kPrimaryColor
                                  : kSecondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  _selectedIndex = index;
                },
                children: const <Widget>[
                  MentorExperience(),
                  MentorAvailability()
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
                text: 'Mentoring Request',
                press: () {
                  Navigator.pushNamed(context, MentorRequestForm.routeName);
                }),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    ));
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
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32),
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
