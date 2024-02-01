import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeteksiHistoryPage extends StatefulWidget {
  @override
  _DeteksiHistoryPageState createState() => _DeteksiHistoryPageState();
}

class _DeteksiHistoryPageState extends State<DeteksiHistoryPage> {
  List<dynamic> deteksiHistoryList = [];

  @override
  void initState() {
    super.initState();
    // Fetch deteksi history saat halaman pertama kali dimuat
    fetchDeteksiHistory();
  }

  Future<void> fetchDeteksiHistory() async {
    final String apiUrl = 'https://82a8-114-142-168-31.ngrok-free.app/deteksi_history_api';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        deteksiHistoryList = jsonDecode(response.body);
      });
    } else {
      print('Error fetching deteksi history: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff130160),
        title: Text('Deteksi History'),
      ),
      body: deteksiHistoryList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: deteksiHistoryList.length,
              itemBuilder: (context, index) {
                var history = deteksiHistoryList[index];
                return ListTile(
                  title: Text('Result: ${history['result']}'),
                  subtitle: Text('Timestamp: ${history['timestamp']}'),
                  // Tambahkan lebih banyak informasi jika diperlukan
                  // ...
                );
              },
            ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeteksiHistoryPage(),
    );
  }
}
