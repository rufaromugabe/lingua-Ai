import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_model.dart';
import '../providers/chats_provider.dart';
import '../services/ai_handler.dart';

class TextAndVoiceField extends ConsumerStatefulWidget {
  const TextAndVoiceField({super.key});

  @override
  ConsumerState<TextAndVoiceField> createState() => _TextAndVoiceFieldState();
}

class _TextAndVoiceFieldState extends ConsumerState<TextAndVoiceField> {
  final _messageController = TextEditingController();
  final AIHandler _lingua = AIHandler();
  var _isReplying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary,
              hintText: 'Type a message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 06,
        ),
        IconButton(
          color: Theme.of(context).colorScheme.onPrimary,
          icon: Icon(Icons.send),
          onPressed: _isReplying
              ? null
              : () {
                  final message = _messageController.text;
                  _messageController.clear();
                  sendTextMessage(message);
                },
        )
      ],
    );
  }

  void sendTextMessage(String message) async {
    setReplyingState(true);
    addToChatList(message, true, DateTime.now().toString());
    addToChatList('Typing...', false, 'typing');
    final aiResponse = await _lingua.getResponse(message);
    removeTyping();
    addToChatList(aiResponse, false, DateTime.now().toString());
    setReplyingState(false);
  }

  void setReplyingState(bool isReplying) {
    setState(() {
      _isReplying = isReplying;
    });
  }

  void removeTyping() {
    final chats = ref.read(chatsProvider.notifier);
    chats.removeTyping();
  }

  void addToChatList(String message, bool isMe, String id) {
    final chats = ref.read(chatsProvider.notifier);
    chats.add(ChatModel(
      id: id,
      message: message,
      isMe: isMe,
    ));
  }
}
