import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScrenn extends StatefulWidget {
  const SplashScrenn({Key? key}) : super(key: key);

  @override
  State<SplashScrenn> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrenn> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/background.svg',
            width: screenSize.width,
            height: screenSize.height,
            fit: BoxFit.cover,
          ),
          Center(
              child: SvgPicture.asset(
            'assets/images/AmazingTasksLogosNN.svg',
            width: 200,
            fit: BoxFit.scaleDown,
          ))
        ],
      ),
    );
  }
}
