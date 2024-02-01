import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _feedbackController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff130160),
        title: Text('FEEDBACK'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Berikan Feedback Anda',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: '',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _submitFeedback();
              },
              style: ElevatedButton.styleFrom(
                primary:
                    Color(0xff130160), // Warna latar belakang yang diinginkan
              ),
              child: Text('Kirim Feedback'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitFeedback() async {
  String feedbackText = _feedbackController.text;

  // Ganti URL dengan URL server XAMPP dan endpoint untuk menyimpan feedback
  var url = Uri.parse('https://82a8-114-142-168-31.ngrok-free.app/predict'); // Ganti sesuai kebutuhan

  try {
    var response = await http.post(
      url,
      body: {'feedback': feedbackText},
    );

    if (response.statusCode == 200) {
      print('Feedback successfully sent to server');
      _showSuccessDialog();
    } else {
      print('Failed to send feedback. Status code: ${response.statusCode}');
      // Handle error response jika diperlukan
    }
  } catch (error) {
    print('Error sending feedback: $error');
    // Handle error exception jika diperlukan
  }

  // Setelah mengirim feedback, bersihkan field input
  _feedbackController.clear();
}


  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feedback Terkirim'),
          content: Text('Terima kasih atas feedback Anda!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
