// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopAuthPage extends StatelessWidget {
  String titleText;
  TopAuthPage({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            "assets/image/logo.png",
            height: 200,
          ),
        ),
        Text(
          titleText,
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ],
    );
  }
}
