import 'package:FreeThinkers/Screens/screens.dart';
import 'package:FreeThinkers/Utils/extra.dart';
import 'package:FreeThinkers/Utils/mycolors.dart';
import 'package:FreeThinkers/Widgets/textInput.dart';
import 'package:flutter/material.dart';
import '../Providers/UserProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: magenta(),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: magenta(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Form(
                  autovalidate: autovalidate,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextInput(
                        controller: nameController,
                        validate: (value) {
                          return genericValidator(value, "Username");
                        },
                        hintText: "Enter username",
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Take me in",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: magenta(),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              context
                                  .read<UserProvider>()
                                  .updateUserName(nameController.text);
                              context
                                  .read<UserProvider>()
                                  .fetchUser(nameController.text);
                              showDialog(
                                context: context,
                                builder: (context) => MyForm(),
                              );
                            } else {
                              setState(() {
                                autovalidate = true;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool termsValue = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        "Terms & Conditions",
        style: TextStyle(
          color: magenta(),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'We have a new service for you where we can:',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(
            "• Help you socialize with like minded people",
          ),
          Text("• Help you in finding discounts on products you like"),
          Text(
              "• Help you get best deals on subscription of platforms you like"),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          highlightColor: Colors.pink[900].withOpacity(0.2),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, Home.homeRoute);
          },
          child: Text(
            'Agree and go Inside!',
            style: TextStyle(
              color: magenta(),
            ),
          ),
        )
      ],
    );
  }
}
