import 'package:flutter/material.dart';
import 'package:super_woman_user/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
           Text('Phone Number'),
            Text('+251 966016473')
          ],
           
         ),
        const SizedBox(height: kDefaultPadding, width: double.infinity,),
               MaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 1.5, horizontal: kDefaultPadding),
          color: kGrayColor,
          onPressed: () {
            // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
          child: const Text(
            'Change Phone Number',
            style: TextStyle(
              color: kSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ],
      ),
    );
  }
}
