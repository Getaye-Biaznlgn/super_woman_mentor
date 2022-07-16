import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_woman_user/utils/constants.dart';

class RoleModelContent extends StatelessWidget {
  static const String routeName = '/route-name';
  const RoleModelContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Lorem Ipsum Dolor sit...'),
        ),
        body: Column(children: [
          const Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text('lorem'),
            )),
          ),
          Card(
              color: Colors.transparent,
              elevation: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(FontAwesomeIcons.arrowLeft),
                      onPressed: () {}),
                  const Text('1 of 10 pages'),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.arrowRight),
                    onPressed: () {},
                  )
                ],
              ))
        ]));
  }
}
