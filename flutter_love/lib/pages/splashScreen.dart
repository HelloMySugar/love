import 'package:flutter/material.dart';
import './home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;

  _SplashScreenState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
      }
    });
    _animationController.forward(); // 播放动画
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.asset(
        'assets/images/screen.jpeg',
        scale: 1.0,
        fit: BoxFit.cover,
        gaplessPlayback: true // 原始图像将保留,直到新图像完成加载并且不会出现“白色闪烁间隙”.
      ),

    );
  }
}
