import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/constants.dart';
import 'package:super_woman_user/controller/role_model.dart';
import '../../../../models/role_model.dart';
import 'package:super_woman_user/ui/screens/home/components/role_model_card.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);
  RoleModelController roleModelController = RoleModelController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
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
          Expanded(
            child: FutureBuilder(
                future: roleModelController.fetchRoleModels(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Faild to load data'),
                      );
                    } else if (snapshot.hasData) {
                      List<RoleModel> roleModels =
                          snapshot.data as List<RoleModel>;
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
          )
        ],
      ),
    );
  }
}
