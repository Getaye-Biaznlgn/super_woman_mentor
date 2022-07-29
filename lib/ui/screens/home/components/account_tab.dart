import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/providers/themes.dart';
import 'package:super_woman_user/ui/screens/edit_phone_no/edit_phone_no.dart';
import 'package:super_woman_user/ui/screens/edit_profile/edit_profile.dart';
import 'package:super_woman_user/ui/screens/interest_setting/screen_argument.dart';
import 'package:super_woman_user/ui/screens/mentor/mentor.dart';
import 'package:super_woman_user/ui/screens/mentor_request/mentor_request.dart';
import 'package:super_woman_user/ui/screens/my_mentor/my_mentor.dart';
import 'package:super_woman_user/utils/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../l10n/L10n.dart';
import '../../../../providers/locale_provider.dart';
import '../../interest_setting/interest_setting.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    final provider = Provider.of<LocaleProvider>(context);
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
            ListTile(
                leading: const Icon(FontAwesomeIcons.user),
                title: const Text('Edit Profile'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, EditProfile.routeName);
                }),
            ListTile(
                leading: const Icon(Icons.call_outlined),
                title: const Text('Phone Number'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, EditPhoneNo.routeName);
                }),
            ListTile(
                leading: const Icon(FontAwesomeIcons.userNinja),
                title: const Text('My Mentor'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, MyMentor.routeName);
                }),
            ListTile(
              leading: const Icon(FontAwesomeIcons.inbox),
              title: const Text('My Interest'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, InterestSetting.routeName,
                    arguments: ScreenArgument(
                      isInSetting: true,
                    ));
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.question),
              title: const Text('Request'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, MentorRequest.routeName);
              },
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
                    activeColor: kSecondaryColor,
                    onToggle: (value) {
                      if (value) {
                        themeNotifier.setDarkMode();
                      } else {
                        themeNotifier.setLightMode();
                      }
                    }),
              ),
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.globe),
              title: Text('Lang'
               // AppLocalizations.of(context)!.language
                ),
              trailing: DropdownButton<Locale>(
                value: provider.locale,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // ),
                onChanged: (Locale? newValue) {
                  // dropdownValue = newValue!;
                  provider.setLocale(newValue ?? const Locale('en'));
                },
                items: L10n.all.map<DropdownMenuItem<Locale>>((Locale value) {
                  return DropdownMenuItem<Locale>(
                    value: value,
                    child: Text(value.languageCode),
                  );
                }).toList(),
              ),
            ),
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
            Navigator.pushNamed(context, Mentor.routeName);
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
