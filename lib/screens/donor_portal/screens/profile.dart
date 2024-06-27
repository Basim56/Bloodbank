import 'package:blood_bank/screens/donor_portal/screens/donor_create_request.dart';

import 'package:blood_bank/screens/user_portal/screens/entry_to_login_signup.dart';
import 'package:blood_bank/screens/user_portal/screens/login.dart';
import 'package:blood_bank/screens/user_portal/widgets/profile_item.dart';
import 'package:blood_bank/screens/user_portal/widgets/profile_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Text(
                'Basim Afzal',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.place_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Karachi, Sindh Pakistan')
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _makePhoneCall('03102078203'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const DonorCreateRequestScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Request',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileItem(bigText: 'B-', smallText: 'Blood Type'),
                SizedBox(
                  width: 20,
                ),
                ProfileItem(bigText: '1', smallText: 'Donated'),
                SizedBox(
                  width: 20,
                ),
                ProfileItem(bigText: '3', smallText: 'Requested'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileSettingsItem(
              icon: Icons.event_available,
              settingText: 'Become a Patient',
              onPress: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => const LoginScreen(),
                ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileSettingsItem(
              icon: Icons.help,
              settingText: 'Get Help',
              onPress: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileSettingsItem(
              icon: Icons.logout,
              settingText: 'Logout',
              onPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        'You have successfully Logged Out!',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    const EntryToLoginSignUpScreen(),
                              ),
                            );
                          },
                          child: const Text('Ok'),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
