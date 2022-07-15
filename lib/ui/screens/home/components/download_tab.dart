import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../utils/constants.dart';

class DownloadTab extends StatelessWidget {
  const DownloadTab({Key? key}) : super(key: key);

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
                  'assets/images/r2.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lorem Ipsum Dolar Sit',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  const Text(
                    '10:30 min',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                FontAwesomeIcons.bookOpen,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: kDefaultPadding / 2,
                              ),
                              Text(
                                'Read',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.pause)),
                      const Text('80%'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
