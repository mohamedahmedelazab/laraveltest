// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:aktest/core/constant/colors.dart';

// ignore: must_be_immutable
class ElevatedLoginButton extends StatelessWidget {
  String textButton;
  MaterialStateProperty<Color?>? btncolor;
  Function()? onPressed;
  ElevatedLoginButton({
    Key? key,
    required this.textButton,
    required this.btncolor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: btncolor,
          fixedSize:
              MaterialStateProperty.all(const Size(double.maxFinite, 50))),
      child: Text(
        textButton,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onPressed: onPressed,
    );
  }
}
