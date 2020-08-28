import 'package:flutter/material.dart';
import './views/love_show.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List showList = [
//    {
//      'url': 'https://images.pexels.com/photos/3754303/pexels-photo-3754303.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//      'word': '爱茉莉氨基酸砥砺，奋进按时爱的色放拉三等奖弗兰克啊就了解了解家老实交代发牢骚',
//      'alignment': Alignment.topLeft
//    },
//    {
//      'url': 'https://images.pexels.com/photos/3754299/pexels-photo-3754299.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//      'word': '阿斯顿福建爱上了阿萨德解放啦撒的交房萨拉的飞机拉水电费静安寺',
//      'alignment': Alignment.topLeft
//    },
//    {
//      'url': 'https://images.pexels.com/photos/3754169/pexels-photo-3754169.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//      'word': '阿斯顿福建爱上了看阿斯加德弗拉时代峻峰拉时间段飞拉萨的',
//      'alignment': Alignment.topRight
//    },
//    {
//      'url': 'https://images.pexels.com/photos/3754243/pexels-photo-3754243.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//      'word': '维吾尔文二阿萨德飞拉萨的房价ADSL开发',
//      'alignment': Alignment.topRight
//    },
//    {
//      'url': 'https://images.pexels.com/photos/3754295/pexels-photo-3754295.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//      'word': '群文件我去了阿萨德解放啦是就的分类萨克大家发牢骚打飞机奥德赛',
//      'alignment': Alignment.centerLeft
//    },
//    {
//      'url': 'https://images.pexels.com/photos/3754244/pexels-photo-3754244.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//      'word': '群文件我去了阿萨德解放啦是就的分类萨克大家发牢骚打飞机奥德赛',
//      'alignment': Alignment.centerLeft
//    },
    {
      'url': '1',
      'word': '在朋友眼中，我一个开朗活泼的大男孩，不拘小节，对生活也漫不经心',
      'alignment': Alignment.topLeft
    },
    {
      'url': '2',
      'word': '而你，从看到你的那一刻起，我的心跳就告诉我你是我今生等待的人。你给了我勇气和动力，我会用一生的努力来呵护这份心动',
      'alignment': Alignment.topCenter
    },
    {
      'url': '4',
      'word': '但爱一个人好难，想一个人好痛，等一个人好累，但为了你一切都值，为了你痛并快乐。情路漫长，为你付出全部，沉醉不知归路！',
      'alignment': Alignment.topLeft
    },
    {
      'url': '3',
      'word': '你的眼睛真好看，里面有日月，冬夏，晴雨，山川，花草，鸟兽，但还是我的眼睛更好看，因为里面有你...',
      'alignment': Alignment.topCenter
    },
    {
      'url': '5',
      'word': '最难忘的是你的微笑，当它绽开在你的脸上时，我仿佛感到拂过一阵春风，暖融融的，把我的心都融化了',
      'alignment': Alignment.topCenter
    },
    {
      'url': '6',
      'word': '我有一个很长很长的故事，需要一生一世，慢慢讲给你听...',
      'alignment': Alignment.center
    },
    {
      'url': '7',
      'word': '所以，你愿意和我在一起吗？',
      'alignment': Alignment.center
    }
  ];
  int currentIndex = 0;

  AudioPlayer advancedPlayer = new AudioPlayer();
  _playLocal() async {
    _stopLocal();
    AudioCache audioCache = AudioCache(fixedPlayer: advancedPlayer);
    await audioCache.play('audio/love.mp3');
  }
  _stopLocal() {
    advancedPlayer.stop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //播放背景音乐
    _playLocal();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stopLocal();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    _stopLocal();
  }

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    //隐藏状态栏
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
//      appBar: AppBar(title: Text('告白气球')),
      body: Center(
        child: InkWell(
          onTap: () {
            int newIndex = currentIndex;
            if(currentIndex == showList.length - 1) {
              newIndex = 0;
//              _stopLocal();
            }else{
              newIndex ++;
            }
            setState(() {
              currentIndex = newIndex;
            });
          },
          child: LoveShow(showList[currentIndex]),
        ),
      ),
    );
  }
}
