import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/models/field.dart';
import 'package:super_woman_user/ui/screens/home/home_screen.dart';
import 'package:super_woman_user/utils/constants.dart';

import '../../../../providers/auth.dart';

class Body extends StatefulWidget {
  bool isInSetting;
  Body({required this.isInSetting, Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Field> fields = [];
  List<Field> userInterests = [];
  InterestList interestList = InterestList();
  bool _isLoading = false;
  // Future<void> getAllInterests() async {
  //   fields = await ;
  // }

  Future getUserInterests() async {
    String token = Provider.of<Auth>(context, listen: false).token;
    userInterests = await interestList.fetchUserInterests(token);
  }

  @override
  void initState() {
    super.initState();
    getUserInterests();
  }

  bool _isSelected(int id) {
    int index = userInterests.indexWhere((field) => field.id == id);
    if (index == -1) return false;
    return true;
  }

  _updateUserInterest() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String? token = Provider.of<Auth>(context, listen: false).token;
      List<int> selectedFieldsId = userInterests.map((el) => el.id).toList();
      await interestList.updateUserInterest(selectedFieldsId, token);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } catch (e) {
      //
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _toggleInterest(int id, at) {
    int index = userInterests.indexWhere((field) => field.id == id);
    if (index != -1) {
      setState(() {
        userInterests.removeAt(index);
      });
    } else {
      setState(() {
        userInterests.add(fields[at]);
      });
    }
  }

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
            child: FutureBuilder(
              future: interestList.fetchAllFields(),
              builder: (ctx, snapshot) {
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                    // if we got our data
                  } else if (snapshot.hasData) {
                    // List<Field>
                    
                    fields = snapshot.data as List<Field>;

                    return GridView.builder(
                      itemCount: fields.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 2,
                              mainAxisSpacing: 10.0),
                      itemBuilder: (BuildContext context, int index) {
                        // print(snapshot);
                        return getInterestWidget(fields[index],
                            _isSelected(fields[index].id), index);
                      },
                    );
                  }
                }

                // Displaying LoadingSpinner to indicate waiting state
                return const Center(
                  child: CircularProgressIndicator(),
                );
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
                  onPressed: _updateUserInterest,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_isLoading)
                        const Padding(
                          padding: EdgeInsets.only(left: kDefaultPadding),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                    ],
                  ),
                  //  const Text(
                  //   'Done',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
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

  Widget getInterestWidget(Field field, bool isSelected, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: isSelected ? kSecondaryColor : kGrayColor,
          onPressed: () {
            _toggleInterest(fields[index].id, index);
          },
          child: Text(
            field.title,
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
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
