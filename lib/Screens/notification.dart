import 'package:FreeThinkers/Screens/screens.dart';
import 'package:FreeThinkers/Utils/mycolors.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  static const notificationRoute = 'Notification';

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: lightGrey(),
        appBar: AppBar(
          backgroundColor: magenta(),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            tabs: [
              Tab(
                child: Text(
                  'Feed',
                ),
              ),
              Tab(
                child: Text(
                  'Groups',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [Feed(), Groups()],
        ),
      ),
    );
  }
}
