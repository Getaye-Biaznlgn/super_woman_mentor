import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/ui/screens/chat/chat_screen.dart';
import '../../../providers/auth.dart';
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
  // late final Auth auth;
  static List<Widget> _widgetOptions = <Widget>[
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
   String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Goodd Evening';
}
  @override
  void initState() {
    super.initState();
    final Auth auth = Provider.of<Auth>(context, listen: false);
    auth.getUserInfo(token: auth.token);
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);

    return Scaffold(
        appBar: AppBar(
          title: getAppBarTitle(auth),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.routeName);
              },
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

  Widget getAppBarTitle(Auth auth) {
    switch (_selectedIndex) {
      case 0:
        return ListTile(
          title: Text('${auth.firstName ?? ''} ${auth.lastName ?? ''}'),
          subtitle:  Text(greeting()),
          leading: auth.profilePicture == null
              ? CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: Text(
                    auth.firstName?.substring(0, 1).toUpperCase() ?? '',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              :
              // FadeInImage(placeholder: AssetImage('assets/images/profile.jpg'), image: NetworkImage(auth.profilePicture))

              CircleAvatar(
                  backgroundImage: NetworkImage(auth.profilePicture!),
                ),
        );
      case 1:
        return const Text(
          "Role model",
          // AppLocalizations.of(context)!.roleModelAppBarTitle
        );
      case 2:
        return const Text(
          "downlaods",
          // AppLocalizations.of(context)!.myDownloadsAppBarTitle
        );
      case 3:
        return const Text("Profile"
            // AppLocalizations.of(context)!.profileAppBarTitle
            );
      default:
        return const Text('');
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""
            // AppLocalizations.of(context)!.homeNavBarTitle,
            ),
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: ""
            // AppLocalizations.of(context)!.roleModelAppBarTitle,
            ),
        BottomNavigationBarItem(
            icon: Icon(Icons.file_download_outlined), label: "My Downloads"
            // AppLocalizations.of(context)!.myDownloadsAppBarTitle,
            ),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user), label: "Profile"
            // AppLocalizations.of(context)!.profileAppBarTitle,
            ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kPrimaryColor,
      onTap: _onItemTapped,
    );
  }
}
