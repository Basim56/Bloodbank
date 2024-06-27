import 'package:blood_bank/screens/donor_portal/screens/tabs.dart';
import 'package:blood_bank/screens/user_portal/screens/splash_screen.dart';
import 'package:blood_bank/screens/user_portal/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 9, 140),
              brightness: Brightness.light),
          textTheme: GoogleFonts.latoTextTheme()),
      home: const SplashScreen(),
    );
  }
}
