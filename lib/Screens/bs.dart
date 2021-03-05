import 'package:FreeThinkers/Firebase/firebaseRefs.dart';
import 'package:FreeThinkers/Utils/extra.dart';
import 'package:FreeThinkers/Utils/mycolors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../Widgets/textInput.dart';
import 'package:provider/provider.dart';
import '../Providers/UserProvider.dart';

class UrlPage extends StatefulWidget {
  static const urlRoute = "URL";
  @override
  _UrlPageState createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  Uuid uuid = Uuid();
  final urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: magenta(),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        children: <Widget>[
          TextInput(
            hintText: "URL",
            controller: urlController,
            validate: (value) {
              return genericValidator(value, "URL");
            },
          ),
          RaisedButton(
            color: magenta(),
            onPressed: () async {
              DataSnapshot data = await historyRef.once();
              historyRef.push().set({
                "processed": false,
                "url": urlController.text,
                "userId": context.read<UserProvider>().userid,
              });
              urlController.text = '';
            },
            child: Text(
              "Browse",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
