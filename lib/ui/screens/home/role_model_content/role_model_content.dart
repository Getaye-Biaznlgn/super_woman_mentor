import 'package:flutter/material.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(children: [
            const Expanded(
              child: SingleChildScrollView(child: Text('lorem')),
            ),
            Card(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: const Icon(Icons.back_hand), onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.forward),
                  onPressed: () {},
                )
              ],
            ))
          ]),
        ));
  }
}
