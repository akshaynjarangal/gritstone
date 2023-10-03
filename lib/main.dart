import 'dart:io';

import 'package:elthor/src/constants/get_it.dart';
import 'package:elthor/src/providers/bottom_nav_provider.dart';
import 'package:elthor/src/providers/ride_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/screens/bottom_nav.dart';

class MyHttpoverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
    ..badCertificateCallback = (X509Certificate cert, String host, int port)=>true;
  }
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpoverrides();
  setupDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => getIt<RideProvider>()..getRideData,
        child: const MyApp(),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomNavProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elthor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff393185)),
        useMaterial3: true,
      ),
      home: const BottomNav(),
    );
  }
}
