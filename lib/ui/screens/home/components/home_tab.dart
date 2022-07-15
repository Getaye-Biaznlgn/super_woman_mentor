import 'package:flutter/material.dart';

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
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: kPrimaryColor)),
              child: SizedBox(
              
                  height: size.height * 0.2,
                  width: double.infinity,
                  child: Image.asset('assets/images/r1.jpg', fit: BoxFit.fill,)),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Recent Published',
                  style: TextStyle(fontSize: kBodyMediumTextSize),
                ),
                Text('See All')
              ],
            ),
            CardItem(size: size),
            CardItem(size: size),
            CardItem(size: size),
            CardItem(size: size),
            CardItem(size: size),
            CardItem(size: size),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: kDefaultPadding * 1 / 2,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lorem Ipsum Dolar Sit',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.thumb_up_outlined,
                              size: kBodyMediumTextSize * 0.8,
                            ),
                          ),
                          const Text('0'),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.message,
                              size: kBodyMediumTextSize * 0.8,
                            ),
                          ),
                          const Text('0')
                        ]),
                  ),
                  const Text(
                    'Lorem Ipsum Dolar Sit amet'
                    'Lorem Ipsum dolar here...',
                    maxLines: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
