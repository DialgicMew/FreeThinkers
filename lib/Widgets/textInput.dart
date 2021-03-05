import 'package:flutter/material.dart';
import 'package:FreeThinkers/utils/extra.dart';

class TextInput extends StatelessWidget {
  TextInput({this.labelText, this.controller, this.validate, this.hintText});
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String Function(String) validate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.015, horizontal: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
        boxShadow: shadow(),
      ),
      child: Center(
        child: TextFormField(
          validator: validate,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          controller: controller == null ? null : controller,
          cursorColor: Colors.black,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 20),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
      ),
    );
  }
}
