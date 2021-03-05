import 'package:FreeThinkers/Screens/bs.dart';
import 'package:FreeThinkers/Screens/notification.dart';
import 'package:FreeThinkers/Utils/extra.dart';
import 'package:FreeThinkers/Utils/mycolors.dart';
import 'package:FreeThinkers/Widgets/homePageSections.dart';
import 'package:flutter/material.dart';
import '../Providers/UserProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const homeRoute = 'Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey(),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: magenta(),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Hi, " + context.watch<UserProvider>().userName + "!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            NotificationPage.notificationRoute,
                          );
                        },
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: shadow1(),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      subtitle: Text(
                        "EUR 35.50",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      title: Text("Bills Due in 2 days"),
                      trailing: RaisedButton(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: magenta(),
                        onPressed: () {
                          Navigator.pushNamed(context, UrlPage.urlRoute);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: <Widget>[
                        HomeSection(
                          heading: "Service Status(HAL Driven)",
                        ),
                        HomeSection(
                          heading: "Service Outtage(BBF Driven)",
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
