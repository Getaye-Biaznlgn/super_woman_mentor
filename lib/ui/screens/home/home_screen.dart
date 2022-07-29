import 'package:flutter/material.dart';
import 'components/account_tab.dart';
import 'components/download_tab.dart';
import 'components/role_model_tab.dart';
import 'package:super_woman_user/utils/constants.dart';
import 'components/home_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// 700
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
     HomeTab(),
     RoleModelTab(),
    DownloadTab(),
    AccountTab(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: getAppBarTitle(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.message),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.bell),
            )
          ],
        ),
        body: Container(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: buildBottomNavigationBar());
  }

  Widget getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return const ListTile(
          title: Text('Ruhama Abebe'),
          subtitle: Text('Good Morning'),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
        );
      case 1:
        return  Text("role model",
          // AppLocalizations.of(context)!.roleModelAppBarTitle
          );
      case 2:
        return  Text("downlaods",
          // AppLocalizations.of(context)!.myDownloadsAppBarTitle
          );
      case 3:
        return  Text("profile"
          // AppLocalizations.of(context)!.profileAppBarTitle
          );
      default:
        return  const Text('');
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: ""
          // AppLocalizations.of(context)!.homeNavBarTitle,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search_outlined),
          label: ""
          // AppLocalizations.of(context)!.roleModelAppBarTitle,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.file_download_outlined),
          label: ""
          // AppLocalizations.of(context)!.myDownloadsAppBarTitle,
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesomeIcons.user),
          label:"Profile" 
          // AppLocalizations.of(context)!.profileAppBarTitle,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kPrimaryColor,
      onTap: _onItemTapped,
    );
  }
}
