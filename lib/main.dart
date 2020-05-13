import 'package:flutter/material.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Link Generator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'WhatsApp Link Generator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController _phone = new TextEditingController();
  TextEditingController _message = new TextEditingController();

  void _showDialog(String url) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("WhatsApp Link"),
          content: new Text(url),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Share Link"),
              onPressed: () {
                Share.share("My WhatsApp: ${url}");

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: new InputDecoration(
                    labelText: 'Type your WhatsApp phone number',
                    hintText: 'Number',
                    icon: new Icon(Icons.phone, size: 24,)
                ),
                keyboardType: TextInputType.phone,
                controller: _phone,
              ),
              SizedBox(height: 12,),
              TextField(
                decoration: new InputDecoration(
                    labelText: 'Custom Message',
                    hintText: 'Message',
                    icon: new Icon(Icons.message, size: 24,)
                ),
                autocorrect: true,
                keyboardType: TextInputType.text,
                controller: _message,
              ),
              SizedBox(height: 12,),
              Text("Example: “Hello, I want more info about the product”"),
              SizedBox(height: 12,),
              RaisedButton(
                color: Colors.green,
                child: Text("Generate & Share Link", style: TextStyle(color: Colors.white),),
                onPressed: (){
                    String url = "https://wa.me/${_phone.text}?text=${_message.text}";
                    _showDialog(url);
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
