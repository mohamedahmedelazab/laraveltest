import 'package:aktest/core/constant/colors.dart';
import 'package:aktest/data/static/onbordingdata.dart';
import 'package:aktest/view/screen/homePage.dart';
import 'package:aktest/view/widget/onbording/bodyWiget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({Key? key}) : super(key: key);

  @override
  _OnbordingPageState createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  final PageController _controller = PageController();
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            onPageChanged: (v) {
              setState(() {
                lastPage = (v == 2);
              });
            },
            controller: _controller,
            children: [
              onbordingBodyWidget(
                  title: onbording[0].title,
                  image: onbording[0].image,
                  subTitle: onbording[0].subTitle),
              onbordingBodyWidget(
                  title: onbording[1].title,
                  image: onbording[1].image,
                  subTitle: onbording[1].subTitle),
              onbordingBodyWidget(
                  title: onbording[2].title,
                  image: onbording[2].image,
                  subTitle: onbording[2].subTitle),
            ],
          ),
          Positioned(
              bottom: 50,
              left: 175,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const SwapEffect(
                    dotWidth: 10, dotHeight: 10, dotColor: onbordingColor),
              )),
          lastPage
              ? Positioned(
                  bottom: 45,
                  right: 50,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(color: onbordingColor, fontSize: 17),
                    ),
                  ))
              : Container()
        ],
      )),
    );
  }
}
