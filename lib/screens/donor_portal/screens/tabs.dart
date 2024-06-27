import 'package:blood_bank/screens/donor_portal/screens/donor_home.dart';
import 'package:blood_bank/screens/donor_portal/screens/donor_create_request.dart';
import 'package:blood_bank/screens/donor_portal/screens/profile.dart';
import 'package:blood_bank/screens/donor_portal/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DonorTabs extends StatefulWidget {
  const DonorTabs({super.key});

  @override
  State<DonorTabs> createState() => _TabsState();
}

class _TabsState extends State<DonorTabs> {
  int _currentPageIndex = 0;

  void currentIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    switch (_currentPageIndex) {
      case 1:
        currentScreen = const SearchScreen();
        break;
      case 2:
        currentScreen = const DonorCreateRequestScreen();
        break;
      case 3:
        currentScreen = const ProfileScreen();
        break;
      case 0:
      default:
        currentScreen = const DonorHomeScreen();
        break;
    }

    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GNav(
            backgroundColor: Theme.of(context).colorScheme.primary,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.56),
            gap: 8,
            padding: const EdgeInsets.all(16),
            onTabChange: currentIndex,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.electric_bolt,
                text: 'Request',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
