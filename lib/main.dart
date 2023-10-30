import 'package:flutter/material.dart';
import 'package:flutter_webview_app/api/firebase_api.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{ 
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
await FirebaseApi().initNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebView App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Analytics'),
        centerTitle: true,
        actions: <Widget>[IconButton(onPressed: () {_showPopup(context);}, icon:const Icon(Icons.notifications)
        ),
        ],
        backgroundColor: Colors.orangeAccent,
      ),
      body: WebView(
        initialUrl: 'https://tvanalytics.admongrel.net',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NotificationPopup();
      },
    );
  }
}

class NotificationPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 200,
        height: 600,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'This is a notification popup!',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
