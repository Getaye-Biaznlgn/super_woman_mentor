import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/providers/locale_provider.dart';
import 'package:super_woman_user/ui/screens/home/home_screen.dart';
import 'package:super_woman_user/utils/routes.dart';
import 'l10n/l10n.dart';
import 'providers/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(),
      ),
      ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => MaterialApp(
              title: 'Super woman',
              supportedLocales: L10n.all,
              locale: localeProvider.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              theme: theme.getTheme(),
              debugShowCheckedModeBanner: false,
              routes: routes,
              initialRoute: HomeScreen.routeName,
            ));
  }
}
