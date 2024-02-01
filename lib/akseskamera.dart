import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dartbasic/constans.dart';
import 'package:dartbasic/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akses Kamera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: KameraPage(),
    );
  }
}

class KameraPage extends StatefulWidget {
  final String title = 'Upload to flask';

  _KameraPageState createState() => _KameraPageState();
}

class _KameraPageState extends State<KameraPage> {
  File? selectedImage;
  String? message = "Upload image sukses!";

  uploadImage() async {
    final request = http.MultipartRequest(
        "POST", Uri.parse("https://82a8-114-142-168-31.ngrok-free.app/upload"));

    final headers = {"Content-type": "multipart/form-data"};

    request.files.add(http.MultipartFile('image',
        selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
        filename: selectedImage!.path.split("/").last));

    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];
    setState(() {
      // Tampilkan pesan sukses menggunakan SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gambar berhasil diunggah!'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(imagePicked!.path);
    setState(() {});
  }

  Future getCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.camera);
    selectedImage = File(imagePicked!.path);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff130160),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedImage == null
                ? Text("Please pick image to upload")
                : Image.file(selectedImage!),
            MaterialButton(
              onPressed: uploadImage,
              color: Color(0xff130160), // Warna yang diinginkan
              child: Text(
                "Upload",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => getCamera(),
            child: Icon(Icons.add_a_photo),
            backgroundColor: Color(0xff130160),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () => getImage(),
            child: Icon(Icons.image),
            backgroundColor: Color(0xff130160),
          ),
        ],
      ),
    );
  }
}
