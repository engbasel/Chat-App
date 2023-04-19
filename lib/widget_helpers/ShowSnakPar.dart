import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void SnackbarMethod(BuildContext context, massege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massege)));
}
