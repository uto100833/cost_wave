import 'package:flutter/material.dart';

class NotificationToggleTile extends StatefulWidget {
  const NotificationToggleTile({super.key});

  @override
  State<NotificationToggleTile> createState() => _NotificationToggleTileState();
}

class _NotificationToggleTileState extends State<NotificationToggleTile> {
  bool isNotificationOn = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Enable Notifications'),
      subtitle: const Text('Receive alerts for budget overspending.'),
      value: isNotificationOn,
      onChanged: (bool value) {
        setState(() {
          isNotificationOn = value;
        });
      },
    );
  }
}
