import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_task/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_task/provider/post_provider.dart';
import 'package:mobile_task/screens/nav_button_page.dart';
import 'package:mobile_task/screens/splash_screen.dart';
import 'provider/auth_proivder.dart';
import 'package:mobile_task/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'screens/create_post.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final FirebaseAuth auth = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(create: (_) => AuthProvider()),
        Provider<PostProvider>(create: (_) => PostProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: auth.currentUser == null
            ? const SplashScreen()
            : const NavButtonHome(),
      ),
    );
  }
}
