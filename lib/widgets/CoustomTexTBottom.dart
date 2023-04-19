import 'package:flutter/material.dart';

class CoustomTextBouttom extends StatelessWidget {
  CoustomTextBouttom({required this.TextBottom, this.ONtaped});
  String? TextBottom;
  VoidCallback? ONtaped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ONtaped,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 40.0,
        child: Center(
          child: Text(
            TextBottom!,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
