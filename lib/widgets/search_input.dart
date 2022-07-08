import 'package:flutter/material.dart';

import '../pages/search_page.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchInputState();
  }
}

class _SearchInputState extends State<SearchInput> with SingleTickerProviderStateMixin {
  static const List<String> titles = [
    'hello Flutter | hello Flutter',
    'hello JavaScript | hello JavaScript',
    'hello iOS | hello iOS',
    'hello Web | hello Web',
    'hello Android | hello Android',
    'hello Java | hello Java'
  ];

  int _currentIndex = 0;

  late AnimationController _animationController;
  late Animation<Offset> _outAnimation;
  late Animation<Offset> _intoAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 5), () {
            _currentIndex++;
            _animationController.reset();
            _animationController.forward();
          });
        }
      });
    _outAnimation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -40))
        .animate(CurvedAnimation(parent: _animationController, curve: const Interval(0, 0.5)));
    _intoAnimation = Tween<Offset>(begin: const Offset(0, 40), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.5, 1)));
    Future.delayed(const Duration(seconds: 5), () {
      _animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildChild();
  }

  Widget _buildChild() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const SearchPage();
        }));
      },
      child: ClipRect(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              const SizedBox(width: 5),
              const Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
              Expanded(child: _buildOutTitle()),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }

  /// 出场动画
  Widget _buildOutTitle() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildTitle(titles[_currentIndex % titles.length], _outAnimation),
        _buildTitle(titles[(_currentIndex + 1) % titles.length], _intoAnimation),
      ],
    );
  }

  /// 构建title
  Widget _buildTitle(String title, Animation<Offset> animation) {
    return Transform.translate(
      offset: animation.value,
      child: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
