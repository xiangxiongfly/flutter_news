import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const List<String> todayHotList = [
    '故宫春节开放时间',
    '国家科学技术奖',
    '香港41名公务员被捕',
    '机票作废躲过坠机',
    'NBA全明星二轮票王',
    '黑龙江富豪被分尸',
  ];

  static const List<String> topicList = [
    '老人公安局门口被保安推倒骨折',
    '57岁关之琳与光头男爬山',
    '珠珠谈入选全球最美面孔',
    '2019国家科学技术奖',
    '埋尸案二审维持原判',
    '陈晓陈妍希同框',
    '金卡戴珊花样炫富',
    '周华健回应婚后不顾家',
    '李小璐直播间带货秀鸽子蛋钻戒',
    '不良鱼贩往水里加柴油',
  ];

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchInput(context),
            const SizedBox(height: 20),
            _buildTodayHot(),
            const SizedBox(height: 20),
            _buildTopic(),
          ],
        ),
      ),
    );
  }

  /// 搜索框
  Widget _buildSearchInput(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SizedBox(
            height: 45,
            child: TextField(
              autofocus: true,
              maxLines: 1,
              minLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Color(0xFFEEEEEE),
                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFEEEEEE))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFEEEEEE))),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFEEEEEE))),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: "故宫春节开放时间",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Text("取消"),
        ),
      ],
    );
  }

  /// 今日热点
  Widget _buildTodayHot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "今日热点",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 15,
          runSpacing: 10,
          children: todayHotList.map((e) => _buildHotText(e)).toList(),
        ),
      ],
    );
  }

  /// 热点的子组件
  Widget _buildHotText(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEEEEE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(text),
    );
  }

  /// 话题榜
  Widget _buildTopic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "话题榜",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 7 / 1,
          ),
          itemBuilder: (context, index) => _buildTopicItem(topicList[index], index),
          itemCount: topicList.length,
        )
      ],
    );
  }

  Widget _buildTopicItem(String text, int index) {
    index += 1;
    var color = [1, 2, 3].contains(index) ? Colors.pink : Colors.grey;
    return Text.rich(
      TextSpan(
        text: "$index",
        style: TextStyle(color: color),
        children: [
          TextSpan(text: " $text", style: const TextStyle(color: Colors.black)),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
