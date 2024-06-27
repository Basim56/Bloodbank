import 'package:blood_bank/screens/user_portal/screens/entry_to_login_signup.dart';
import 'package:flutter/material.dart';

class InfoScreen2 extends StatelessWidget {
  const InfoScreen2({super.key, required this.onNextPage});
  final VoidCallback onNextPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/info/info_2__.jpg',
              height: 250,
            ),
            const Text(
              'Post A Blood Request',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'With an interface that\'s easy to interact with, can efficiently tend to your needs.',
                style: TextStyle(
                    color: Color.fromARGB(255, 87, 83, 83),
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const EntryToLoginSignUpScreen()));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 20),
                    )),
                const Spacer(),
                TextButton(
                    onPressed: onNextPage,
                    child: const Text('Next', style: TextStyle(fontSize: 20)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
