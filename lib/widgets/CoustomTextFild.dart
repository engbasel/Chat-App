import 'package:flutter/material.dart';

class CoustomTextFormFild extends StatelessWidget {
  CoustomTextFormFild({required this.hentText, this.onChanged});
  String? hentText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (Data_Valdition) {
        if (Data_Valdition!.isEmpty) {
          return 'Field is Required';
        }
        return null;
      },
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        // fontFamily: 'pacifico',
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hentText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellowAccent,
            width: 2.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}

//   
//    
//   
// 
// 