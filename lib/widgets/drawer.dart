import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';
import 'package:lingua_ai/screens/Responsivescreen.dart';
import '../providers/chats_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: <Widget>[
          Container(
            height: 85,
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
                  Navigator.pop(context);
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
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Responsettings()),
              );
            },
          ),
        ],
      ),
    );
  }
}
