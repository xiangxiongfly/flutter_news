import 'package:flutter/material.dart';
import 'package:flutter_news/pages/message_page.dart';
import 'package:flutter_news/pages/setting_page.dart';
import 'package:flutter_news/pages/video_page.dart';
import 'package:flutter_news/utils/utils.dart';
import 'package:flutter_news/widgets/search_input.dart';

import 'home_page.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({Key? key}) : super(key: key);

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  int _navigationIndex = 0;
  List<Widget> widgets = const [HomePage(), VideoPage(), MessagePage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var body = widgets[_navigationIndex];
    var appBar = _navigationIndex != 3
        ? AppBar(
            title: const SearchInput(),
            actions: const [
              AppBarActionsPublish(),
              SizedBox(width: 15),
            ],
          )
        : null;
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navigationIndex,
        onTap: (index) {
          setState(() {
            _navigationIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "视频",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "消息",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "设置",
          ),
        ],
      ),
    );
  }
}

class AppBarActionsPublish extends StatelessWidget {
  const AppBarActionsPublish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSnackBar(context, "发布");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 26,
          ),
          Text(
            "发布",
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
