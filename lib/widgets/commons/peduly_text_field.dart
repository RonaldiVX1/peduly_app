import 'package:flutter/material.dart';

class PedulyTextField extends StatelessWidget {
  PedulyTextField(
      {Key key,
      @required this.text,
      @required this.hint,
      @required this.controller,
      this.maxLines})
      : super(key: key);

  final Widget text;
  final String hint;
  final int maxLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text,
        SizedBox(height: 10),
        TextField(
          showCursor: true,
          cursorColor: Colors.black45,
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
