import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoveShow extends StatelessWidget {
  var showObject;

  LoveShow(this.showObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ConstrainedBox(
            child:
//            Image.network(
//              showObject['url'],
//              fit: BoxFit.cover,
//              gaplessPlayback: true // 原始图像将保留,直到新图像完成加载并且不会出现“白色闪烁间隙”.
//            ),
            Image.asset(
              'assets/images/loveShow/${showObject['url']}.jpeg',
              fit: BoxFit.cover,
              gaplessPlayback: true // 原始图像将保留,直到新图像完成加载并且不会出现“白色闪烁间隙”.
            ),
            constraints: BoxConstraints.expand(),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Container(
              width: ScreenUtil().setWidth(750 / 2),
              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Text(
                showObject['word'],
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(36),
                  color: Colors.white,
                  fontWeight: FontWeight.normal
                ),
              ),
            ),
            alignment: showObject['alignment'],
          )
        ],
      ),
    );
  }
}
