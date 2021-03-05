import 'package:FreeThinkers/Widgets/halTiles.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final String heading;
  const HomeSection({this.heading});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            heading,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          HalTile(
            number: "+36 577 8489",
            title: "Frank's Mobile Service",
            subTitle:
                "Service will be temporary suspended due to request by customer",
          ),
          HalTile(
            number: "+36 577 8489",
            title: "Frank's Mobile Service",
            subTitle:
                "Service will be temporary suspended due to request by customer",
          ),
        ],
      ),
    );
  }
}
