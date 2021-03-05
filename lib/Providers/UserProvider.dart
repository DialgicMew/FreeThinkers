import 'package:FreeThinkers/Firebase/firebaseRefs.dart';
import 'package:FreeThinkers/Models/models.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String usernameValue = "David";
  UserModel user;
  String userid;

  String get userName => usernameValue;

  fetchUser(String name) async {
    List<dynamic> list = List();
    DataSnapshot userSnapshot =
        await userRef.orderByChild("name").equalTo(name).once();
    Map<dynamic, dynamic> userValue = userSnapshot.value;
    print(userValue);
    userValue.forEach((key, value) {
      userid = key;
      list.add(value);
    });
    print(list);
    user = UserModel.fromSnapshot(list[0]);
    print(user);
    notifyListeners();
  }

  updateUser(String groupNew) async {
    List list = List();
    print(user.group);
    user.group.forEach((element) {
      list.add(element);
    });
    list.add(groupNew);
    user.group = list;

    List list2 = List();
    print(user.recommendgroup);
    user.recommendgroup.forEach((element) {
      list2.add(element);
    });
    list2.remove(groupNew);

    await userRef.child(userid).update({
      "joinedGroupId": list,
      "name": usernameValue,
      "recommendedGroupId": list2
    });
    notifyListeners();
  }

  updateUserName(String userName) {
    usernameValue = userName;
    notifyListeners();
  }

  updateUserID(String id) {
    notifyListeners();
  }
}
