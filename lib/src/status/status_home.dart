import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/bottom_nav_provider.dart';
import 'provider/get_status_provider.dart';
import 'screen/splash_screen.dart';


class MyAppI extends StatelessWidget {
  const MyAppI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => GetStatusProvider()),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}