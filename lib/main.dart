import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:healthyfitapp/firebase_options.dart';
import 'package:healthyfitapp/model/myuser_model.dart';
import 'package:healthyfitapp/pages/admin_feeling.dart';
import 'package:healthyfitapp/pages/admin_saran_doa.dart';
import 'package:healthyfitapp/pages/feeling.dart';
import 'package:healthyfitapp/pages/home.dart';
import 'package:healthyfitapp/pages/saran_doa.dart';
import 'package:healthyfitapp/pages/authentication/splash_screen.dart';
import 'package:healthyfitapp/pages/textfield_feeling.dart';
import 'package:healthyfitapp/pages/wrapper.dart';
import 'package:healthyfitapp/services/auth.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //       options: const FirebaseOptions(
  //           apiKey: "AIzaSyBMqiux-iY6SlwwyG59q0lpY2HKcyOG3tM",
  //           appId: "1:977815128634:web:c4151f0cfe5a7308228303",
  //           messagingSenderId: "977815128634",
  //           projectId: "healthyfit-bf235"));
  // } else {

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/SplashScreen",
        routes: {
          '/SplashScreen': (context) => AnimatedSplashScreen(
                splash: const SplashScreen(),
                duration: 5000,
                splashTransition: SplashTransition.scaleTransition,
                centered: true,
                nextScreen: const Wrapper(),
                splashIconSize: double.infinity,
                animationDuration: const Duration(milliseconds: 2000),
              ),
          '/Login': (context) => const Wrapper(),
          '/Home': (context) => Home(),
          '/SaranDoa': (context) => SaranDoa(),
          '/Feeling': (context) => const Feeling(),
          '/TextFieldFeeling': (context) => TextFieldFeeling(),
          '/AdminSaranDoa': (context) => AdminSaranDoa(),
          '/AdminFeeling': (context) => AdminFeeling(),
        },
        // home: Wrapper(),
      ),
    );
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: "/SplashScreen",
    //   routes: {
    //     '/SplashScreen': (context) => const SplashScreen(),
    //     '/Home': (context) => const Home(),
    //     '/SaranDoa': (context) => const SaranDoa(),
    //     '/Feeling': (context) => const Feeling(),
    //     '/TextFieldFeeling': (context) => const TextFieldFeeling(),
    //   },
    // );
  }
}
