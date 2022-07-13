import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/bean/model.dart';
import 'package:flutter_news/http/http.dart';
import 'package:flutter_news/pages/webview_page.dart';
import 'package:flutter_news/utils/utils.dart';

class NewsList extends StatefulWidget {
  final String newsKey;

  const NewsList(this.newsKey, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewsListState();
  }
}

class _NewsListState extends State<NewsList> {
  final List<Datas> _newsList = [];
  CancelToken cancelToken = CancelToken();

  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  @override
  void dispose() {
    cancelToken.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(_newsList[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
            color: Color(0xFFCCCCCC),
          );
        },
        itemCount: _newsList.length,
      ),
    );
  }

  Future _onRefresh() async {
    try {
      final url = "article/list/${widget.newsKey}/json";
      var response = await Http().dio.get(url, cancelToken: cancelToken);
      if (response.statusCode == 200) {
        String result = response.toString();
        if (result.isNotEmpty) {
          // var newsModel = NewsModel.fromJson(response.data);
          NewsModel newsModel = newsModelFromJson(response.toString());
          _newsList.clear();
          _newsList.addAll(newsModel.data?.datas ?? []);
          setState(() {});
        }
      } else {
        if (mounted) showSnackBar(context, "请求失败:${response.statusCode} ${response.statusMessage}");
      }
    } catch (e) {
      if (mounted) showSnackBar(context, "请求失败");
      print("请求失败:$e");
    }
  }

  Widget _buildItem(Datas datas) {
    String imgUrl = "https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png";
    return GestureDetector(
      onTap: () {
        toDetail(datas.link);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${datas.title}",
                    style: const TextStyle(fontSize: 18),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 5),
                Image.network(
                  imgUrl,
                  height: 70,
                  width: 112,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              "${datas.superChapterId}评论 ${computeTime(datas.niceDate ?? "")}发布",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  String computeTime(String time) {
    try {
      var datetime = DateTime.parse(time);
      var now = DateTime.now();
      var difference = now.difference(datetime);
      if (difference.inDays > 0) {
        return "${difference.inDays}天前";
      }
      if (difference.inHours > 0) {
        return "${difference.inHours}时前";
      }
      if (difference.inMinutes > 0) {
        return "${difference.inMinutes}分前";
      }
      return "1分钟前";
    } on Exception catch (e) {
      return time;
    }
  }

  toDetail(String? url) {
    if (url == null) return;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return WebViewPage(url);
    }));
  }
}
