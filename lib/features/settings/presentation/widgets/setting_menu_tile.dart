import 'package:flutter/material.dart';

class MySettingsMenuTile extends StatelessWidget {
  const MySettingsMenuTile(
      {super.key,
      this.trailing,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.onTap});

  final Widget icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
    );
  }
}
