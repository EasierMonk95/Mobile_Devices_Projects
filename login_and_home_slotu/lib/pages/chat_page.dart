import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      final user = 'dani@gmail.com'; // Reemplaza esto con el usuario logeado
      await FirebaseFirestore.instance.collection('messages').add({
        'text': _controller.text,
        'timestamp': FieldValue.serverTimestamp(),
        'sender': user,
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.green[900],
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white, // Fondo blanco para todo el área del chat
                child: MessagesList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Escribe un mensaje...',
                        filled: true,
                        fillColor: Colors.white, // Fondo blanco para el campo de texto
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _sendMessage,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MessagesList extends StatelessWidget {
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


        return Container(
          color: Colors.green[900],
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final sender = message['sender'] ?? 'Anónimo';
              final timestamp = message['timestamp'] as Timestamp?;
              final time = timestamp != null
                  ? DateFormat('hh:mm a').format(timestamp.toDate())
                  : 'Desconocido';

              return ListTile(
                title: Text(
                  sender,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(message['text']),
                trailing: Text(
                  time,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
