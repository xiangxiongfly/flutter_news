import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFEEEEEE),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogin(context),
            const SizedBox(height: 5),
            _buildCommonFunctions(),
            const SizedBox(height: 5),
            _buildMore(),
          ],
        ),
      ),
    );
  }

  /// 登录按钮
  Widget _buildLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 80, bottom: 50),
      color: Colors.white,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        radius: 50,
        child: const Text(
          "登录",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  /// 常用功能
  Widget _buildCommonFunctions() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "常用功能",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildFunctionItem(Icons.hearing, "关注"),
              _buildFunctionItem(Icons.notifications, "消息通知"),
              _buildFunctionItem(Icons.star, "收藏"),
              _buildFunctionItem(Icons.history, "阅读历史"),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildFunctionItem(Icons.wallet, "钱包"),
              _buildFunctionItem(Icons.edit, "用户反馈"),
              _buildFunctionItem(Icons.invert_colors, "免流量服务"),
              _buildFunctionItem(Icons.settings, "系统设置"),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// 常用功能item
  Widget _buildFunctionItem(IconData iconData, String text) {
    return Column(
      children: [
        Icon(iconData, size: 30),
        Text(text),
      ],
    );
  }

  /// 更多功能
  Widget _buildMore() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "更多功能",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 30),
          Table(
            children: [
              TableRow(children: [
                _buildFunctionItem(Icons.memory, "超级会员"),
                _buildFunctionItem(Icons.public, "圆梦公益"),
                _buildFunctionItem(Icons.merge_type, "夜间模式"),
                _buildFunctionItem(Icons.comment, "评论"),
              ]),
              TableRow(children: [
                Container(height: 30),
                Container(),
                Container(),
                Container(),
              ]),
              TableRow(children: [
                _buildFunctionItem(Icons.favorite, "点赞"),
                _buildFunctionItem(Icons.scanner, "扫一扫"),
                _buildFunctionItem(Icons.fingerprint, "广告推广"),
                Container(),
              ]),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
