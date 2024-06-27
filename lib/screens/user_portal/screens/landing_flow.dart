import 'package:blood_bank/screens/user_portal/screens/entry_to_login_signup.dart';
import 'package:blood_bank/screens/user_portal/screens/info_screen1.dart';
import 'package:blood_bank/screens/user_portal/screens/info_screen2.dart';
import 'package:flutter/widgets.dart';

class LandingFlow extends StatefulWidget {
  const LandingFlow({super.key});

  @override
  State<LandingFlow> createState() => _LandingFlowState();
}

class _LandingFlowState extends State<LandingFlow> {
  final _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        InfoScreen(
          onNextPage: _nextPage,
        ),
        InfoScreen2(onNextPage: _nextPage),
        const EntryToLoginSignUpScreen()
      ],
    );
  }
}
