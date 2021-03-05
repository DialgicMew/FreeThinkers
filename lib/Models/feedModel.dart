class FeedModel {
  String group;
  String message;
  FeedModel({
    this.group,
    this.message,
  });

  FeedModel.fromSnapshot(dynamic snapshot)
      : group = snapshot['group'],
        message = snapshot['message'];
}
