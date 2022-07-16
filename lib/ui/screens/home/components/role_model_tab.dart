import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';

class RoleModelTab extends StatelessWidget {
  const RoleModelTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/r3.jpg',
                  fit: BoxFit.contain,
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