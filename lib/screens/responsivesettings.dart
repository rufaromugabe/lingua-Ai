import 'package:flutter/material.dart';

class SettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 500,
          width: 400,
          padding: EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
          ),
          margin: EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10.0),
          ),
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
        Positioned(
          right: 0.0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
