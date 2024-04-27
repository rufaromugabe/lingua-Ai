import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_model.dart';
import '../providers/chats_provider.dart';
import '../services/ai_handler.dart';

class AITextField extends ConsumerStatefulWidget {
  const AITextField({super.key});

  @override
  ConsumerState<AITextField> createState() => _AITextFieldState();
}

class _AITextFieldState extends ConsumerState<AITextField> {
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
              fillColor: Colors.deepPurple.withOpacity(0.1),
              hintText: 'Type a message',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none),
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
