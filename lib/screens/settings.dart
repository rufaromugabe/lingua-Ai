import 'package:flutter/material.dart';

class Appsettings extends StatelessWidget {
  const Appsettings({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Account'),
              ListTile(
                title: Text('Person'),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text('Manage Account'),
                leading: Icon(Icons.email),
              ),
              ListTile(
                title: Text('Privacy'),
                leading: Icon(Icons.lock),
              ),
              Text('App'),
              ListTile(
                title: Text('Main Language'),
                leading: Icon(Icons.language),
              ),
              ListTile(
                title: Text('Modes'),
                leading: Icon(Icons.settings_outlined),
              ),
              ListTile(
                title: Text('About'),
                leading: Icon(Icons.info),
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
