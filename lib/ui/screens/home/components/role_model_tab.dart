import 'package:flutter/material.dart';
import 'package:super_woman_user/controller/role_model.dart';
import 'package:super_woman_user/ui/screens/home/components/role_model_card.dart';
import '../../../../models/role_model.dart';
import '../../../../utils/constants.dart';

class RoleModelTab extends StatelessWidget {
  RoleModelController roleModelController = RoleModelController();
  RoleModelTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: FutureBuilder(
          future: roleModelController.fetchRoleModels(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Faild to load data'),
                );
              } else if (snapshot.hasData) {
                List<RoleModel> roleModels = snapshot.data as List<RoleModel>;
                return ListView.builder(
                    itemCount: roleModels.length,
                    itemBuilder: (context, index) => RoleModelCard(
                        id: roleModels[index].id,
                        img: roleModels[index].img,
                        intro: roleModels[index].intro,
                        title: roleModels[index].title,
                        like: roleModels[index].like,
                        comment: roleModels[index].comment));
              }
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

// class CardItem extends StatelessWidget {
//   const CardItem({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: kDefaultPadding),
//       child: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, RoleModelDetail.routeName);
//         },
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 1,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   'assets/images/r3.jpg',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: kDefaultPadding * 1 / 2,
//             ),
//             Expanded(
//               flex: 2,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Lorem Ipsum Dolar Sit',
//                     maxLines: 2,
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                   SizedBox(
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.thumb_up_outlined,
//                               size: kBodyMediumTextSize * 0.8,
//                             ),
//                           ),
//                           const Text('0'),
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.message,
//                               size: kBodyMediumTextSize * 0.8,
//                             ),
//                           ),
//                           const Text('0')
//                         ]),
//                   ),
//                   const Text(
//                     'Lorem Ipsum Dolar Sit amet'
//                     'Lorem Ipsum dolar here...',
//                     maxLines: 2,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
