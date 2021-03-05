import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:FreeThinkers/Utils/extra.dart';

class HalTile extends StatelessWidget {
  const HalTile({
    this.title,
    this.number,
    this.subTitle,
  });
  final String title;
  final String number;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: shadow(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: Container(
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  "https://image.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg",
              fit: BoxFit.cover,
            ),
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.teal[300],
            border: Border.all(
              width: 5,
              color: Colors.white,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title),
            Text(
              number,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
        subtitle: Text(subTitle),
      ),
    );
  }
}
