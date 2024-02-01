import 'package:dartbasic/akseskamera.dart';
import 'package:dartbasic/chatbot.dart';
import 'package:dartbasic/constans.dart';
import 'package:dartbasic/history.dart';
import 'package:dartbasic/feedback.dart';
import 'package:dartbasic/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff130160),
          title: const Text("BERANDA"),
        ),
        backgroundColor: Color(0xffE5E5E5),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KameraPage()));
                  },
                  splashColor: Colors.lightBlueAccent,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset('assets/img/upload1.png')),
                        const Text(
                          'UPLOAD',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              ),
            ),
            Container(
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedbackPage()));
                  },
                  splashColor: Colors.lightBlueAccent,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset('assets/img/feedback1.png')),
                        const Text(
                          'FEEDBACK',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              ),
            ),

            Container(
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeteksiHistoryPage()));
                  },
                  splashColor: Colors.lightBlueAccent,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset('assets/img/history1.png')),
                        const Text(
                          'HISTORY',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              ),
            ),

            Container(
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatBotApp()));
                  },
                  splashColor: Colors.lightBlueAccent,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset('assets/img/chatbot1.png')),
                        const Text(
                          'CHATBOT',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              ),
            ),
          ],
        ));
  }
}
