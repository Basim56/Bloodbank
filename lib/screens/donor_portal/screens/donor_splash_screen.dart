import 'dart:async';

import 'package:blood_bank/screens/donor_portal/screens/login.dart';
import 'package:flutter/material.dart';

class DonorSplashScreen extends StatefulWidget {
  const DonorSplashScreen({super.key});

  @override
  State<DonorSplashScreen> createState() => _DonorSplashScreenState();
}

class _DonorSplashScreenState extends State<DonorSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const DonorLoginScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 84, 113),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'You are Welcomed',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: const Color.fromARGB(151, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 57, 93, 159),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset('assets/images/donor_portal/donorsplash.png',
            fit: BoxFit.cover),
      ),
    );
  }
}
