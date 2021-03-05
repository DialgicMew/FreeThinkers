import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

shadow() {
  return [
    BoxShadow(
      offset: Offset(1, 1),
      color: Colors.grey[300],
    )
  ];
}

shadow1() {
  return [
    BoxShadow(
      offset: Offset(1, 3),
      color: Colors.grey[300],
    )
  ];
}

nameValidator(value) {
  if (!isNull(value)) {
    if (isNumeric(value)) {
      return 'Enter valid Name';
    } else {
      if (value.contains(RegExp(r'[0-9]'))) {
        return 'Enter valid Name';
      } else {
        return null;
      }
    }
  }
  return 'Required Field';
}

dropValidator(value, String property) {
  var a = isNull(value) ? property + ' is required' : null;
  return a;
}

emailValidator(value) {
  if (isEmail(value)) {
    return null;
  }
  return 'Enter valid email';
}

lineValidator(value) {
  if (!isNull(value)) {
    return null;
  }
  return 'Enter valid address';
}

genericValidator(value, property) {
  if (!isNull(value)) {
    return null;
  }
  return 'Enter valid ' + property;
}

pincodeValidator(value) {
  if (isNumeric(value)) {
    return null;
  }
  return 'Enter valid pincode';
}

numberValidator(value) {
  if (isNumeric(value)) {
    if (value.length != 10) {
      return 'Enter valid number';
    } else {
      return null;
    }
  }
  return 'Enter valid number';
}
