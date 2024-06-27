import 'package:flutter/material.dart';

class ProfileSettingsItem extends StatelessWidget {
  const ProfileSettingsItem(
      {super.key,
      required this.icon,
      required this.settingText,
      required this.onPress});
  final IconData icon;
  final String settingText;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.black54)),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          settingText,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        onTap: onPress,
      ),
    );
  }
}
