// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:aktest/core/constant/colors.dart';

// ignore: must_be_immutable
class onbordingBodyWidget extends StatelessWidget {
  String title;
  String subTitle;
  String image;
  onbordingBodyWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 350,
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(
          endIndent: 50,
          indent: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 25, color: onbordingColor),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            textAlign: TextAlign.center,
            subTitle,
            style: const TextStyle(fontSize: 15, color: textColor),
          ),
        )
      ],
    );
  }
}
