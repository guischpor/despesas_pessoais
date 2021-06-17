import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final Function(String) onSubmitted;
  final String labelText;

  AdaptativeTextField({
    this.controller,
    this.keyBoardType,
    this.onSubmitted,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyBoardType,
              onSubmitted: onSubmitted,
              placeholder: labelText,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
            ),
            keyboardType: keyBoardType,
            onSubmitted: onSubmitted,
          );
  }
}
