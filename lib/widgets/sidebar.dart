import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingua_ai/screens/Responsivescreen.dart';
import 'package:lingua_ai/screens/responsivesettings.dart';
import '../providers/chats_provider.dart';

class Appsidebar extends StatelessWidget {
  const Appsidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.deepPurple))),
              child: ListTile(
                title: Text('Lingua AI'),
                leading: Icon(Icons.bubble_chart_rounded),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final chatNotifier = ref.watch(chatsProvider.notifier);
                return ListTile(
                  title: Text('New Chat'),
                  leading: Icon(Icons.edit),
                  onTap: () {
                    chatNotifier.newChat();
                  },
                );
              },
            ),
            ListTile(
              title: Text('History'),
              leading: Icon(Icons.history),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
              },
            ),
            Spacer(),
            ListTile(
              title: Text('Person'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.settings),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SettingsDialog(); // Your custom dialog widget
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
