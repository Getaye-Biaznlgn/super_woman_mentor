import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/models/request.dart';
import 'package:super_woman_user/utils/constants.dart';

import '../../../../providers/auth.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  RequestList _requestList = RequestList();
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context, listen: false);
    return Padding(
        padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            bottom: kDefaultPadding / 2),
        child: FutureBuilder(
            future: _requestList.fetchAllRequests(auth.token),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Faild to load data'),
                  );
                } else if (snapshot.hasData) {
                  List<Request> requests = snapshot.data as List<Request>;
                  return ListView.builder(
                    itemCount: requests.length,
                    itemBuilder: (context, index) => RequestItem(
                      mentorName: requests[index].mentor,
                      date: 'May 12, 2022',
                      status: requests[index].state,
                      message: requests[index].message,
                      onMore: () {},
                    ),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
              // return ListView(
              //   children: [
              //     Request(
              //       mentorName: 'Eden Getachew',
              //       date: 'May 12, 2022',
              //       status: 'Accepted',
              //       message:
              //           'The path provided below has to start and end with a slash in order for'
              //           'it to work correctly',
              //       interest: 'Interest in Software Engineering',
              //       onMore: () {},
              //     ),
              //   ],
              // );
            }));
  }
}

class RequestItem extends StatelessWidget {
  String mentorName;
  String? date;
  String? status;
  String? message;
  Function onMore;
  RequestItem({
    required this.mentorName,
    required this.date,
    this.status,
    this.message,
    required this.onMore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sent to $mentorName',
            ),
            Text('$status',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: status!.toLowerCase() == 'accepted'
                        ? kSecondaryColor
                        : kPrimaryColor))
          ],
        ),
        Text(' $date'),
        Container(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text('$message...'),
              TextButton(
                child: const Text(
                  'Read more',
                  style: TextStyle(
                      color: kSecondaryColor, fontWeight: FontWeight.bold),
                ),
                onPressed: onMore(),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
