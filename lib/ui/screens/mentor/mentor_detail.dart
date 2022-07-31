import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/mentor/mentor_request_form.dart';
import 'package:super_woman_user/ui/widgets/primary_button.dart';
import 'package:super_woman_user/utils/constants.dart';
import '../../../models/mentor.dart';
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
    final mentor = ModalRoute.of(context)!.settings.arguments as Mentor;

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
              name: mentor.firstName + ' ' + mentor.lastName,
              field: 'Project Manager, Google',
              noOfMentee: mentor.noOfMentee,
              ppic: mentor.profilePicture,
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
                children: <Widget>[
                  MentorExperience(experiences: mentor.experiences ?? []),
                  MentorAvailability(availability: mentor.availablity ?? [])
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
                child: const Text(
                  'Mentoring Request',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                press: () {
                  Navigator.pushNamed(context, MentorRequestForm.routeName, arguments: mentor.id);
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
  String? ppic;
  MentorProfile({
    required this.name,
    required this.field,
    required this.noOfMentee,
    this.ppic,
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
        (ppic == null)
            ? CircleAvatar(
                radius: 36,
                child: Text(
                  name.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32),
                ),
                backgroundColor: kPrimaryColor,
              )
            : CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(ppic!),
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
