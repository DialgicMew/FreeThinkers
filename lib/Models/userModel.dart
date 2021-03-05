class UserModel {
  List<dynamic> group = [];
  String name;
  List<dynamic> recommendgroup = [];

  UserModel({
    this.group,
    this.name,
    this.recommendgroup,
  });

  UserModel.fromSnapshot(dynamic snapshot)
      : name = snapshot['name'],
        recommendgroup = snapshot['recommendedGroupId'],
        group = snapshot['joinedGroupId'];
}
