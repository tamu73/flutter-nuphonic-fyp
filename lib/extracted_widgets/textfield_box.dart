import 'package:flutter/material.dart';
import 'package:nuphonic_front_end/shared/shared.dart';

class TextFieldBox extends StatelessWidget {

  final String hint;

  TextFieldBox({this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 24,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        fillColor: textFieldColor,
        filled: true,
        hintStyle: normalFontStyle.copyWith(
          color: whitishColor.withOpacity(0.25),
          fontSize: 14
        ),
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

