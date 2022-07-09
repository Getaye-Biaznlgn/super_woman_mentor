import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/utils/routes.dart';
import 'providers/themes.dart';
import '/ui/screens/login/login.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => MaterialApp(
              title: 'Super woman',
              theme: theme.getTheme(),
              debugShowCheckedModeBanner: false,
              routes: routes,
              initialRoute: Login.routeName,
            ));
  }
}
