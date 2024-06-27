import 'dart:convert';

import 'package:blood_bank/screens/donor_portal/screens/donor_splash_screen.dart';
import 'package:blood_bank/screens/user_portal/screens/entry_to_login_signup.dart';
import 'package:blood_bank/screens/user_portal/screens/reward_screen.dart';
import 'package:blood_bank/screens/user_portal/widgets/profile_item.dart';
import 'package:blood_bank/screens/user_portal/widgets/profile_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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
      print('Could not launch $phoneNumber');
    }
  }

  Future<int> fetchTotalDonations() async {
    final response =
        await http.get(Uri.parse('http://10.23.42.79:3001/auth/donations'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['totalDonations'];
    } else {
      throw Exception('Failed to load total donations');
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
                    'Call Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
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
            // FutureBuilder<int>(
            //   future: fetchTotalDonations(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const CircularProgressIndicator();
            //     } else if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     } else if (snapshot.hasData) {
            //       return Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           ProfileItem(
            //               bigText: snapshot.data.toString(),
            //               smallText: 'Donated'),
            //           const SizedBox(width: 20),
            //           const ProfileItem(bigText: '3', smallText: 'Requested'),
            //         ],
            //       );
            //     } else {
            //       return const Text('No data available');
            //     }
            //   },
            // ),
            const SizedBox(
              height: 20,
            ),
            ProfileSettingsItem(
              icon: Icons.event_available,
              settingText: 'My rewards',
              onPress: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => const CouponScreen(),
                ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileSettingsItem(
              icon: Icons.help,
              settingText: 'Get Help',
              onPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text(
                            'The application supports blood transfusion operations, encourages blood donation, and improves blood inventory control. It provides an easy-to-use interface for donors and receivers, features improved donor registration and real-time blood bank inventory management, significantly increases donor participation through an incentive system, and aims to enhance the effectiveness, safety, and accessibility of blood transfusions, leading to better patient outcomes and reduced medical expenses.'),
                      );
                    });
              },
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
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
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
