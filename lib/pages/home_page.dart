import 'package:flutter/material.dart';
import 'news_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final Map<String, String> _tab = {
    '电视': '1',
    '电影': '2',
    '明星': '3',
    '音乐': '4',
    '体育': '5',
    '财经': '6',
    '军事': '7'
  };

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tab.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: _tab.keys.map((e) => Text(e)).toList(),
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          indicatorColor:  Theme.of(context).primaryColor,
          labelPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        ),
        const Divider(height: 1),
        Flexible(
          child: TabBarView(
            controller: _tabController,
            children: _tab.values.map((e) => NewsList(e)).toList(),
          ),
        ),
      ],
    );
  }
}
