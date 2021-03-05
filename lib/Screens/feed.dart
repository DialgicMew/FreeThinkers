import 'package:FreeThinkers/Models/feedModel.dart';
import 'package:FreeThinkers/Models/models.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Firebase/firebaseRefs.dart';
import '../Providers/UserProvider.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  static const feedRoute = 'Feed';

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        StreamBuilder(
          stream: feedRef.onValue,
          builder: (context, AsyncSnapshot<Event> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('${snapshot.error}'),
                ),
              );
            }
            if (snapshot.data.snapshot.value != null) {
              List list = List();
              Map<dynamic, dynamic> values = snapshot.data.snapshot.value;
              values.forEach((key, values) {
                list.add(values);
              });
              List filtered = list
                  .where((element) => context
                      .watch<UserProvider>()
                      .user
                      .group
                      .contains(FeedModel.fromSnapshot(element).group))
                  .toList();
              // if (filtered.isEmpty) {
              //   return Text('Start joining groups to get benefits!');
              // }

              if (filtered.isNotEmpty) {
                return ListView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Text(
                      "My Feed",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        FeedModel feed =
                            FeedModel.fromSnapshot(filtered[index]);
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListTile(
                            title: Text(feed.message),
                            subtitle: Text(feed.group),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            }
            return Container();
          },
        ),
        StreamBuilder(
          stream: offerRef.onValue,
          builder: (context, AsyncSnapshot<Event> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('${snapshot.error}'),
                ),
              );
            }
            if (snapshot.data.snapshot.value != null) {
              List list = List();
              Map<dynamic, dynamic> values = snapshot.data.snapshot.value;
              values.forEach((key, values) {
                list.add(values);
              });
              List filtered = list
                  .where((element) => context
                      .watch<UserProvider>()
                      .user
                      .group
                      .contains(FeedModel.fromSnapshot(element).group))
                  .toList();

              if (filtered.isEmpty) {
                return Container();
              }
              return ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Text(
                    "Offers for me",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      OfferModel offerModel =
                          OfferModel.fromSnapshot(filtered[index]);
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          title: Text(offerModel.message),
                          subtitle: Text(offerModel.group),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
