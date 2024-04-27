import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/active_theme_provider.dart';
import '../providers/chats_provider.dart';
import 'theme_switch.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.deepPurple))),
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          const Padding(
            padding: const EdgeInsets.only(right: 10.0),
          ),
          Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final chatNotifier = ref.watch(chatsProvider.notifier);
                  return IconButton(
                    onPressed: () {
                      chatNotifier.newChat();
                    },
                    icon: Icon(
                      Icons.library_add_outlined,
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              Consumer(
                builder: (context, ref, child) => Icon(
                  ref.watch(activeThemeProvider) == Themes.dark
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              ),
              const ThemeSwitch(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
