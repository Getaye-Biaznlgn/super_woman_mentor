import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/providers/themes.dart';
import 'package:super_woman_user/utils/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AccountTab extends StatefulWidget {
  AccountTab({Key? key}) : super(key: key);

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpg')),
              title: Text('Ruhama Abebe'),
              subtitle: Text(
                  'Grade 12 student, have passion to be a software Engineer.'),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            const MentorBanner(),
            const ListTile(
              leading: Icon(FontAwesomeIcons.user),
              title: Text('Edit Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              leading: Icon(Icons.call_outlined),
              title: Text('Phone Number'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              leading: Icon(FontAwesomeIcons.userNinja),
              title: Text('My Mentor'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              leading: Icon(FontAwesomeIcons.inbox),
              title: Text('My Interest'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              leading: Icon(FontAwesomeIcons.question),
              title: Text('Request'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
                leading: const Icon(Icons.remove_red_eye_outlined),
                title: const Text('Dark Mode'),
                contentPadding: const EdgeInsets.only(right: 0, left: 15),
                trailing: SizedBox(
                  height: 30,
                  width: 100,
                  child: FlutterSwitch(
                      value: themeNotifier.isDark,
                      onToggle: (value) {
                        if (value) {
                          themeNotifier.setDarkMode();
                        } else {
                          themeNotifier.setLightMode();
                        }
                      }),
                )),
            const SizedBox(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MentorBanner extends StatelessWidget {
  const MentorBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 2, vertical: kDefaultPadding * 1.5),
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(15)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Are you looking for a mentor for advice in your interest?',
          maxLines: 2,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        MaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
          color: Colors.white,
          onPressed: () {
            // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
          child: const Text(
            'Find Mentor',
            style: TextStyle(
              color: kSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
