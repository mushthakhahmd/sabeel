import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:sabeel/db/db_function.dart';
import 'package:sabeel/splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sabeel/state/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await initializeDatabase();

  getCount();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('ml', 'IN'),
        Locale('en', 'US'),
        Locale('hi', 'IN'),
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(context),
      child: Phoenix(
        child: MaterialApp(
          title: 'sabeelulfalah',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
          home: const splash(),
        ),
      ),
    );
  }

  static of(BuildContext context) {}
}
