class OfferModel {
  String user;
  String group;
  String message;
  String status;
  OfferModel({
    this.user,
    this.group,
    this.message,
    this.status,
  });

  OfferModel.fromSnapshot(dynamic snapshot)
      : group = snapshot['group'],
        status = snapshot['status'],
        user = snapshot['user'],
        message = snapshot['message'];
}
