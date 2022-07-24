import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/chat/chat_screen.dart';
import 'package:super_woman_user/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          const ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: kPrimaryColor,
              child: Text(
                'E',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            title: Text('Eden Getachew',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Project Manager, Google\n10 Mentee'),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Disconnect',
                  style: TextStyle(color: kSecondaryColor),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ChatScreen.routeName);
                },
                child: const Text(
                  'Send Message',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
