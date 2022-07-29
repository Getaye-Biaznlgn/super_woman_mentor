import 'package:flutter/material.dart';
import 'package:super_woman_user/utils/constants.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  Body({this.phoneNo});
  String? phoneNo ="";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
         const   EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: kDefaultPadding),
              Text(
                "Enter the code we sent over SMS to ${phoneNo??''}",
              ),
              // buildTimer(),
              OtpForm(phoneNo: phoneNo?? "",),
             
            ],
          ),
        ),
      ),
    );
  }

  // Row buildTimer() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text("This code will expired in "),
  //       TweenAnimationBuilder(
  //         tween: Tween(begin: 30.0, end: 0.0),
  //         duration: Duration(seconds: 30),
  //         builder: (_, dynamic value, child) => Text(
  //           "00:${value.toInt()}",
  //           style: TextStyle(color: kPrimaryColor),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
