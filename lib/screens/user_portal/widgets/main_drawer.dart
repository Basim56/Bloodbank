import 'package:blood_bank/screens/donor_portal/screens/profile.dart';
import 'package:blood_bank/screens/donor_portal/screens/search.dart';
import 'package:blood_bank/screens/user_portal/screens/choose_request.dart';
import 'package:blood_bank/screens/user_portal/widgets/drawer_items.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.78),
                    Theme.of(context).colorScheme.primary.withOpacity(0.35),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo/logo_1_.png',
                    width: 48,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text('Be the Difference')
                ],
              )),
          DrawerItems(
            icon: Icons.receipt_long_outlined,
            text: 'Make A request',
            navigate: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const ChooseRequest()));
            },
          ),
          DrawerItems(
            icon: Icons.search,
            text: 'Search By Blood',
            navigate: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const SearchScreen()));
            },
          ),
          DrawerItems(
            icon: Icons.person_2_outlined,
            text: 'Visit Profile',
            navigate: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const ProfileScreen()));
            },
          )
        ],
      ),
    );
  }
}
