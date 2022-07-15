import 'package:flutter/material.dart';
import 'components/account_tab.dart';
import 'components/download_tab.dart';
import 'components/role_model_tab.dart';
import 'package:super_woman_user/utils/constants.dart';
import 'components/home_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// 700
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static  List<Widget> _widgetOptions = <Widget>[
     HomeTab(),
     RoleModelTab(),
    DownloadTab(),
    AccountTab()
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
        return const Text('Role Models');
      case 2:
        return const Text('My Downloads');
      case 3:
        return const Text('Profile');
      default:
        return Container();
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: 'Role Models',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_download_outlined),
          label: 'Downloads',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kPrimaryColor,
      onTap: _onItemTapped,
    );
  }
}
