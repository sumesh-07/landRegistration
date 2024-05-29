import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:land_registration/providers/LandRegisterModel.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'constant/routes.dart';
import 'providers/MetamaskProvider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // paste the code copied
      // from Firebase SDK below.
      options: const FirebaseOptions(
          apiKey: "AIzaSyDUKuPAQntLbQ_3mljqvOPsHSohS3yLTo0",
          authDomain: "landregistration-8005c.firebaseapp.com",
          projectId: "landregistration-8005c",
          storageBucket: "landregistration-8005c.appspot.com",
          messagingSenderId: "656175610859",
          appId: "1:656175610859:web:0e44448bf2c80b2e42f7ae"));
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => LandRegisterModel(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     navigatorObservers: [FlutterSmartDialog.observer],
    //     builder: FlutterSmartDialog.init(),
    //     home: home_page(),
    //   ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LandRegisterModel>(
          create: (context) => LandRegisterModel(),
        ),
        ChangeNotifierProvider<MetaMaskProvider>(
          create: (context) => MetaMaskProvider()..init(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        // home: home_page(),
      ),
    );
  }
}
