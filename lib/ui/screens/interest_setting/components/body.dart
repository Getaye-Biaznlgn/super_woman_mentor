import 'package:flutter/material.dart';
import 'package:super_woman_user/models/interest.dart';
import 'package:super_woman_user/ui/screens/home/home_screen.dart';
import 'package:super_woman_user/utils/constants.dart';

class Body extends StatefulWidget {
  bool isInSetting;
  Body({required this.isInSetting, Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Interest> _interests = [
    Interest(title: 'News', isSelected: true),
    Interest(title: 'Comedy', isSelected: false),
    Interest(title: 'Society', isSelected: false),
    Interest(title: 'Culture', isSelected: true),
    Interest(title: 'Business', isSelected: true),
    Interest(title: 'Religion', isSelected: false),
    Interest(title: 'Politics', isSelected: false),
    Interest(title: 'Motivation', isSelected: true),
    Interest(title: 'Art', isSelected: false),
    Interest(title: 'Health', isSelected: false),
    Interest(title: 'True Crime', isSelected: true),
    Interest(title: 'History', isSelected: false),
    Interest(title: 'Kids', isSelected: false),
    Interest(title: 'Educational', isSelected: true),
    Interest(title: 'Science', isSelected: true),
    Interest(title: 'Low', isSelected: false),
    Interest(title: 'Film & TV', isSelected: false),
    Interest(title: 'Tech', isSelected: true),
    Interest(title: 'Gaming', isSelected: false),
    Interest(title: 'Crime', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Choose your interests and get the best role model recommendations.'),
          const Text('Don\'t worry, you can always change it latter.'),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: _interests.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10.0),
              itemBuilder: (BuildContext context, int index) {
                return getInterestWidget(
                    _interests[index].title, _interests[index].isSelected, () {
                  setState(() {
                    _interests[index].isSelected =
                        !_interests[index].isSelected;
                  });
                });
              },
            ),
          ),
          const SizedBox(
            height: kDefaultPadding * 0.5,
          ),
          if (!widget.isInSetting)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: kGrayColor,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  },
                  minWidth: width * 0.4,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MaterialButton(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: kPrimaryColor,
                  minWidth: width * 0.4,
                  onPressed: () {},
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          if (widget.isInSetting)
            MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: kPrimaryColor,
              minWidth: double.infinity,
              onPressed: () {},
              child: const Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(
            height: kDefaultPadding * 0.5,
          )
        ],
      ),
    );
  }

  Widget getInterestWidget(String text, bool isSelected, onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(),
        MaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: isSelected ? kSecondaryColor : kGrayColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : kSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
