import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Para obtener el usuario logueado
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  String? _currentUserName;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUserName();
  }

  void _fetchCurrentUserName() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      setState(() {
        _currentUserName = userDoc['name'] ?? 'Usuario';
      });
    }
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty && _currentUserName != null) {
      await FirebaseFirestore.instance.collection('messages').add({
        'text': _controller.text,
        'timestamp': FieldValue.serverTimestamp(),
        'sender': _currentUserName,
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Foro',
          style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: MessagesList(currentUserName: _currentUserName),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.green[900],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje...',
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.green[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.green[800],
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}

class MessagesList extends StatelessWidget {
  final String? currentUserName;

  const MessagesList({Key? key, this.currentUserName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final messages = snapshot.data!.docs;

        if (messages.isEmpty) {
          return Center(
            child: Text(
              'No hay mensajes aún.',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          reverse: true,
          padding: EdgeInsets.all(10),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            final sender = message['sender'] ?? 'Anónimo';
            final isCurrentUser = sender == currentUserName;
            final timestamp = message['timestamp'] as Timestamp?;
            final time = timestamp != null
                ? DateFormat('hh:mm a').format(timestamp.toDate())
                : 'Desconocido';

            return Align(
              alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isCurrentUser ? Colors.green[800] : Colors.green[900],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sender,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isCurrentUser ? Colors.white70 : Colors.white70,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      message['text'],
                      style: TextStyle(
                        color: isCurrentUser ? Colors.white : Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        time,
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}