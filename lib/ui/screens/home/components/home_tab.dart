import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/constants.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            SizedBox(
                height: size.height * 0.25,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/r1.jpg',
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Published",
                  // AppLocalizations.of(context)!.recentPublished,
                  style: const TextStyle(fontSize: kBodyMediumTextSize),
                ),
                Text("See all"
                    // AppLocalizations.of(context)!.seeAll
                    )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}

