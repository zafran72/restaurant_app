import 'package:restaurant_app/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  const SettingsPage({Key? key}) : super(key: key);

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          settingsTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(settingsTitle),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(
            'Restaurant Notification',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            'Enable Notification',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          trailing: Switch.adaptive(
            value: false,
            onChanged: (value) {
              defaultTargetPlatform == TargetPlatform.iOS
                  ? showCupertinoDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Coming Soon!'),
                          content:
                              const Text('This feature will be coming soon!'),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    )
                  : showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Coming Soon!'),
                          content:
                              const Text('This feature will be coming soon!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
