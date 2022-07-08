import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  NewsModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Data? data;
  int? errorCode;
  String? errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['errorCode'] = errorCode;
    map['errorMsg'] = errorMsg;
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  Data.fromJson(dynamic json) {
    curPage = json['curPage'];
    if (json['datas'] != null) {
      datas = [];
      json['datas'].forEach((v) {
        datas?.add(Datas.fromJson(v));
      });
    }
    offset = json['offset'];
    over = json['over'];
    pageCount = json['pageCount'];
    size = json['size'];
    total = json['total'];
  }

  int? curPage;
  List<Datas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['curPage'] = curPage;
    if (datas != null) {
      map['datas'] = datas?.map((v) => v.toJson()).toList();
    }
    map['offset'] = offset;
    map['over'] = over;
    map['pageCount'] = pageCount;
    map['size'] = size;
    map['total'] = total;
    return map;
  }
}

Datas datasFromJson(String str) => Datas.fromJson(json.decode(str));

String datasToJson(Datas data) => json.encode(data.toJson());

class Datas {
  Datas({
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  Datas.fromJson(dynamic json) {
    apkLink = json['apkLink'];
    audit = json['audit'];
    author = json['author'];
    canEdit = json['canEdit'];
    chapterId = json['chapterId'];
    chapterName = json['chapterName'];
    collect = json['collect'];
    courseId = json['courseId'];
    desc = json['desc'];
    descMd = json['descMd'];
    envelopePic = json['envelopePic'];
    fresh = json['fresh'];
    host = json['host'];
    id = json['id'];
    link = json['link'];
    niceDate = json['niceDate'];
    niceShareDate = json['niceShareDate'];
    origin = json['origin'];
    prefix = json['prefix'];
    projectLink = json['projectLink'];
    publishTime = json['publishTime'];
    realSuperChapterId = json['realSuperChapterId'];
    selfVisible = json['selfVisible'];
    shareDate = json['shareDate'];
    shareUser = json['shareUser'];
    superChapterId = json['superChapterId'];
    superChapterName = json['superChapterName'];
    title = json['title'];
    type = json['type'];
    userId = json['userId'];
    visible = json['visible'];
    zan = json['zan'];
  }

  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apkLink'] = apkLink;
    map['audit'] = audit;
    map['author'] = author;
    map['canEdit'] = canEdit;
    map['chapterId'] = chapterId;
    map['chapterName'] = chapterName;
    map['collect'] = collect;
    map['courseId'] = courseId;
    map['desc'] = desc;
    map['descMd'] = descMd;
    map['envelopePic'] = envelopePic;
    map['fresh'] = fresh;
    map['host'] = host;
    map['id'] = id;
    map['link'] = link;
    map['niceDate'] = niceDate;
    map['niceShareDate'] = niceShareDate;
    map['origin'] = origin;
    map['prefix'] = prefix;
    map['projectLink'] = projectLink;
    map['publishTime'] = publishTime;
    map['realSuperChapterId'] = realSuperChapterId;
    map['selfVisible'] = selfVisible;
    map['shareDate'] = shareDate;
    map['shareUser'] = shareUser;
    map['superChapterId'] = superChapterId;
    map['superChapterName'] = superChapterName;
    map['title'] = title;
    map['type'] = type;
    map['userId'] = userId;
    map['visible'] = visible;
    map['zan'] = zan;
    return map;
  }
}
