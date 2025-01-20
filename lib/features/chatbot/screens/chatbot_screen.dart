import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ChatbotScreenState createState() => ChatbotScreenState();
}

class ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add({"isUser": true, "message": message});
    });
    _messageController.clear();

    try {
      final response = await http.post(
        Uri.parse('https://trusting-content-duck.ngrok-free.app/chatbot'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': message}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _messages.add({"isUser": false, "message": data['response']});
        });
      } else {
        setState(() {
          _messages.add(
              {"isUser": false, "message": "Error: Unable to get response."});
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({"isUser": false, "message": "Error: $e"});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user/Avatar-01.jpeg'),
            ),
            SizedBox(width: 10),
            Text('SmartBot', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.teal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ChatBubble(
                    isUser: message['isUser'],
                    avatar: CircleAvatar(
                      backgroundImage: AssetImage(
                        message['isUser']
                            ? 'assets/images/user/Avatar-02.jpeg'
                            : 'assets/images/user/Avatar-01.jpeg',
                      ),
                    ),
                    message: message['message'],
                  );
                },
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.teal),
                  onPressed: () {
                    final message = _messageController.text.trim();
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isUser;
  final CircleAvatar avatar;
  final String message;

  const ChatBubble({
    super.key,
    required this.isUser,
    required this.avatar,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isUser) avatar,
        const SizedBox(width: 8.0),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(14.0),
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            decoration: BoxDecoration(
              color: isUser ? Colors.teal.shade100 : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        if (isUser) const SizedBox(width: 8.0),
        if (isUser) avatar,
      ],
    );
  }
}
