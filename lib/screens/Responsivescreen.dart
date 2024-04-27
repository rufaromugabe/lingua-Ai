import 'package:flutter/material.dart';
import 'package:lingua_ai/screens/chat_screen.dart';
import 'package:lingua_ai/screens/settings.dart';
import 'package:lingua_ai/widgets/sidebar.dart';

class Responsivness extends StatelessWidget {
  const Responsivness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Show sidebar for wider screens
          return Row(children: [
            Flexible(flex: 1, child: Appsidebar() // This is your sidebar
                ),
            Flexible(flex: 3, child: ChatScreen() // This is your content
                )
          ]);
        } else {
          // Show drawer for smaller screens
          return ChatScreen();
        }
      },
    );
  }
}

class Responsettings extends StatelessWidget {
  const Responsettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Show sidebar for wider screens
          return Row(children: [
            Flexible(flex: 1, child: Appsidebar() // This is your sidebar
                ),
            Flexible(flex: 3, child: ChatScreen() // This is your content
                )
          ]);
        } else {
          // Show drawer for smaller screens
          return Appsettings();
        }
      },
    );
  }
}
