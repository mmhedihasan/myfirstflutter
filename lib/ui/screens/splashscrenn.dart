import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynewapp/data/auth_utils.dart';
import 'package:mynewapp/ui/screens/login.dart';
import 'package:mynewapp/ui/screens/main_bottom_navbar_item.dart';

import '../widget/screen_background_widget.dart';

class SplashScrenn extends StatefulWidget {
  const SplashScrenn({Key? key}) : super(key: key);

  @override
  State<SplashScrenn> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrenn> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      checkUserAuthState();
    });
  }
  Future<void> checkUserAuthState() async {
      final bool result = await AuthUtils.checkLoginState();
      if (result){
        await AuthUtils.getAuthData();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainBottomNavbar()), (route) => false);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
      }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ScreenBackground(widget: Center(
          child: SvgPicture.asset(
            'assets/images/AmazingTasksLogosNN.svg',
            width: 200,
            fit: BoxFit.scaleDown,
          ),),)
      );
  }
}

