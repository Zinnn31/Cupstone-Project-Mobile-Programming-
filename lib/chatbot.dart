import 'package:dartbasic/beranda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatBotApp());
}

class ChatBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatBotScreen(),
    );
  }
}

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final List<ChatMessage> _messages = [];

  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Menambahkan pesan selamat datang
    _addBotResponse(
        "Hi, Selamat Datang di ChatBot! Ketik 'mulai' untuk menggunakan Chatbot. 😄");
  }

  void _handleSubmitted(String text) {
    _messageController.clear();
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isUserMessage: true,
      ));

      // Menanggapi pesan dari pengguna
      _handleUserMessage(text);
    });
  }

  void _handleUserMessage(String userMessage) {
    // Logika respon Chatbot tergantung pada pesan pengguna
    String botResponse = getBotResponse(userMessage);
    _addBotResponse(botResponse);
  }

  void _addBotResponse(String response) {
    _messages.add(ChatMessage(
      text: response,
      isUserMessage: false,
    ));
  }

  String getBotResponse(String userMessage) {
    // Logika respon Chatbot
    if (userMessage.toLowerCase() == 'mulai') {
      return 'Silakan tuliskan jenis luka yang ingin Anda ketahui, seperti "luka bakar", "luka lecet", "luka memar", "luka robek", "luka sayatan", "luka tusuk".';
    } else if (userMessage.toLowerCase() == 'luka bakar') {
      return 'Luka bakar terjadi akibat paparan panas atau zat kimia. Segera bilas dengan air dingin dan hindari menggunakan es. Konsultasikan dengan dokter jika luka parah.';
    } else if (userMessage.toLowerCase() == 'luka lecet') {
      return 'Luka lecet biasanya ringan dan dapat diobati dengan membersihkan area luka dan menggunakan perban atau plester. Pastikan tetap bersih dan kering.';
    } else if (userMessage.toLowerCase() == 'luka memar') {
      return 'Luka memar disebabkan oleh trauma pada jaringan lunak. Istirahat, kompres dingin, dan penggunaan obat antiinflamasi dapat membantu meredakan nyeri dan pembengkakan.';
    } else if (userMessage.toLowerCase() == 'luka robek') {
      return 'Luka robek memerlukan penanganan yang lebih serius. Segera bersihkan luka dengan air bersih, tutup dengan perban steril, dan konsultasikan dengan dokter.';
    } else if (userMessage.toLowerCase() == 'luka sayatan') {
      return 'Luka sayatan harus dibersihkan dengan hati-hati, diikuti dengan penutupan menggunakan plester atau perban steril. Jika luka dalam, segera konsultasikan dengan dokter.';
    } else if (userMessage.toLowerCase() == 'luka tusuk') {
      return 'Luka tusuk dapat menyebabkan kerusakan serius pada organ internal. Segera cari bantuan medis dan hindari menarik benda yang menusuk.';
    } else {
      return 'Maaf, saya tidak mengerti. Silakan tuliskan jenis luka yang ingin Anda ketahui, seperti "luka bakar", "luka lecet", dll.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff130160),
        title: Text('ChatBot App'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke HomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );

            // Atau menggunakan Navigator.popUntil
            // Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).canvasColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _messageController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: 'Type your message'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_messageController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({
    required this.text,
    required this.isUserMessage,
  });

  bool get isImage => text.startsWith('http');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: isImage
                  ? Image.network(text)
                  : Image.asset('assets/img/logo.png'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isUserMessage ? 'You' : 'Chatbot',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: isImage ? Image.network(text) : Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
