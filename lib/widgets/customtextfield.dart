// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController inputText;
  String hintText;
 CustomTextField({super.key, required this.inputText, required this.hintText});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      padding:const  EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      width: size.width-50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1.2),
        cursorColor: Colors.grey,
        controller: inputText,
        keyboardType:TextInputType.number,
        decoration:  InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          
        ),
      ),
    );
  }
}