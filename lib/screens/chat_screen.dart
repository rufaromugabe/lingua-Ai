import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingua_ai/providers/search_item_provider.dart';
import 'package:lingua_ai/widgets/drawer.dart';
import '../providers/chats_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/chat_item.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/text_field.dart';

class SearchItem {
  final String title;

  SearchItem({required this.title});
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: const MyAppBar(),
        drawer: MediaQuery.of(context).size.width > 600 ? null : AppDrawer(),
        endDrawer: AppDrawer(),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final chats = ref.watch(chatsProvider).reversed.toList();
                if (chats.isEmpty) {
                  final searchHints =
                      ref.watch(searchItemsProvider).toList().reversed.toList();
                  return Container(
                      alignment: Alignment.bottomLeft,
                      child: CarouselSlider.builder(
                          itemCount: searchHints.length,
                          itemBuilder: (context, index, realIdx) {
                            return Container(
                                alignment: Alignment.bottomLeft,
                                width: 200,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      searchHints[index].title,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      searchHints[index].description,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ));
                          },
                          options: CarouselOptions(
                            autoPlay: false,
                            height: MediaQuery.of(context).size.height *
                                0.15, // 30% of screen height
                            viewportFraction: MediaQuery.of(context)
                                        .size
                                        .width <
                                    600
                                ? 0.6
                                : 0.3, // 90% of screen width if width is less than 600, else 60%
                          )));
                } else {
                  return ListView.builder(
                    reverse: true,
                    itemCount: chats.length,
                    itemBuilder: (context, index) => ChatItem(
                      text: chats[index].message,
                      isMe: chats[index].isMe,
                    ),
                  );
                }
              }),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: AITextField(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
