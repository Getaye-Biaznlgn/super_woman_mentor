import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_woman_user/utils/constants.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final images = [
    'assets/images/r1.jpg',
    'assets/images/r2.jpg',
    'assets/images/r3.jpg',
    'assets/images/r4.jpg',
    'assets/images/r5.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) => Container(
                    height: size.height * 0.25,
                    width: size.width * 0.9,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ))),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            'Lorem ipsum dolor sit'.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(FontAwesomeIcons.bookOpenReader, color: Colors.white),
                    SizedBox(
                      width: 5,
                    ),
                    Text('START READING',
                        style: TextStyle(color: Colors.white, fontSize: 12))
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kSecondaryColor,
                ),
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('LISTEN AUDIO',
                        style: TextStyle(color: Colors.white, fontSize: 12))
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.download_for_offline_outlined,
                    size: 32,
                  ))
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //       // primary: kSecondaryColor,
              //       ),
              //   onPressed: () {},
              //   child: Row(
              //     children: const [
              //       Icon(FontAwesomeIcons.bookOpenReader, color: Colors.white),
              //     ],
              //   ),
              // ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(kDefaultPadding / 2),
            child: Text('To change the Elevated Button color'
                'in Flutter, simply set the style property'
                ' of Elevated Button from the ElevatedButton.'
                ' styleFrom() static method and set the primary'
                ' property to the appropriate color'
                'simply set the style property'
                ' of Elevated Button from the ElevatedButton.'
                ' styleFrom() static method and set the primary'
                ' property to the appropriate color'),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up,
                    size: 20,
                  )),
              const Text(
                '1.2K',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.solidComment,
                    size: 20,
                  )),
              const Text(
                '1.2K',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.linkedin)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.facebook)),
            ],
          ),
          const Divider(
            color: kPrimaryColor,
          ),
          Comment()
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'COMMENTS',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              Icon(
                Icons.account_circle,
                size: 32,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                ),
              ))
            ],
          ),
          const Text('No comment')
        ],
      ),
    );
  }
}
