class GroupModel {
  String name;
  GroupModel({
    this.name,
  });

  GroupModel.fromSnapshot(dynamic snapshot) : name = snapshot['name'];
}
