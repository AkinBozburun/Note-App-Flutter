import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_notes_app/pages/auth_page.dart';
import 'package:my_notes_app/pages/no_internet_page.dart';
import 'package:my_notes_app/tools/providers.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'tools/firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async
{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider
  (
    providers:
    [
      ChangeNotifierProvider(create: (context) => NoteProvider()),
      ChangeNotifierProvider(create: (context) => GoogleLogInProvider())
    ],
    child: MaterialApp
    (
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      title: 'MyNotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData
      (
        scaffoldBackgroundColor: AppStyle.backgroundColor,
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const
      [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: const
      [
        Locale('en'),
        Locale('tr'),
      ],
      home: const NetCheck(),
    ),
  );
}

class NetCheck extends StatefulWidget
{
  const NetCheck({super.key});

  @override
  State<NetCheck> createState() => _NetCheckState();
}

class _NetCheckState extends State<NetCheck>
{
  @override
  void initState()
  {
    FlutterNativeSplash.remove();
    super.initState();
  }

  Future _netCheck() async
  {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult;
  }

  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder
    (
      future: _netCheck(),
      builder: (context, snapshot)
      {
        if(snapshot.data == ConnectivityResult.none)
        {
          return const NoInternetPage();
        }
        else
        {
          return const AuthPage();
        }
      }
    );
  }
}