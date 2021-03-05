import 'package:FreeThinkers/Firebase/firebaseRefs.dart';
import 'package:FreeThinkers/Models/groupModel.dart';
import 'package:FreeThinkers/Models/models.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/UserProvider.dart';

class Groups extends StatefulWidget {
  static const groupsRoute = 'Groups';

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        StreamBuilder(
          stream: userRef.child(context.watch<UserProvider>().userid).onValue,
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
              print(snapshot.data.snapshot.value);
              Map<dynamic, dynamic> values = snapshot.data.snapshot.value;
              UserModel user = UserModel.fromSnapshot(values);
              return ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Text(
                    "My Groups",
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
                    itemCount: user.group.length,
                    itemBuilder: (context, index) {
                      print(user.group[index]);
                      return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          title: Text(user.group[index]),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return Center(
              child: Text('Nothing new in the group!'),
            );
          },
        ),
        StreamBuilder(
          stream: userRef.child(context.watch<UserProvider>().userid).onValue,
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
              print(snapshot.data.snapshot.value);
              Map<dynamic, dynamic> values = snapshot.data.snapshot.value;
              UserModel user = UserModel.fromSnapshot(values);
              if (user.recommendgroup == null)
                return Container();
              else
                return ListView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Text(
                      "Recommended Groups",
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
                      itemCount: user.recommendgroup == null
                          ? 0
                          : user.recommendgroup.length,
                      itemBuilder: (context, index) {
                        print(user.recommendgroup[index]);
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListTile(
                            title: Text(user.recommendgroup[index]),
                            trailing: IconButton(
                              icon: Icon(Icons.group_add),
                              onPressed: () {
                                context
                                    .read<UserProvider>()
                                    .updateUser(user.recommendgroup[index]);
                              },
                            ),
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
