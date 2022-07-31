import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/providers/education_levels.dart';
import 'package:super_woman_user/providers/auth.dart';
import 'package:super_woman_user/providers/locale_provider.dart';
import 'package:super_woman_user/ui/screens/home/home_screen.dart';
import 'package:super_woman_user/ui/screens/interest_setting/interest_setting.dart';
// import 'package:super_woman_user/ui/screens/home/home_screen.dart';
import 'package:super_woman_user/ui/screens/sign_up/sign_up.dart';
import 'package:super_woman_user/utils/routes.dart';
import 'l10n/l10n.dart';
import 'providers/education_levels.dart';
import 'providers/themes.dart';
import 'ui/screens/sign_in/login.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(),
      ),
      ChangeNotifierProvider<Auth>(create: (_) => Auth()),
      ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
      ChangeNotifierProvider<EducationLevels>(create: (_) => EducationLevels())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<EducationLevels>(context, listen: false).getEducationLevel();
  }

  @override
  Widget build(BuildContext context) {
    final LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    final Auth auth = Provider.of<Auth>(context);

    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => MaterialApp(
            title: 'Super woman',
            supportedLocales: L10n.all,
            locale: localeProvider.locale,
            localizationsDelegates: [
              // AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            theme: theme.getTheme(),
            debugShowCheckedModeBanner: false,
            routes: routes,
            // initialRoute: Login.routeName,
            home: auth.isAuth
                ? const HomeScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? const CircularProgressIndicator()
                            : const Login())));
  }
}
