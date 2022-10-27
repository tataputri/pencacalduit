class ModelChannel {
  int? status;
  String? message;
  String? endpoint;
  String? method;
  List<DataChannel>? data;

  ModelChannel(
      {this.status, this.message, this.endpoint, this.method, this.data});

  ModelChannel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    endpoint = json['endpoint'];
    method = json['method'];
    if (json['data'] != null) {
      data = <DataChannel>[];
      json['data'].forEach((v) {
        data!.add(DataChannel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['endpoint'] = endpoint;
    data['method'] = method;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataChannel {
  Channel1? channel1;
  Channel1? channel2;
  Channel1? channel3;
  int? matchId;
  String? createdDate;
  String? createdTime;
  String? id;

  DataChannel(
      {this.channel1,
      this.channel2,
      this.channel3,
      this.matchId,
      this.createdDate,
      this.createdTime,
      this.id});

  DataChannel.fromJson(Map<String, dynamic> json) {
    channel1 =
        json['channel1'] != null ? Channel1.fromJson(json['channel1']) : null;
    channel2 =
        json['channel2'] != null ? Channel1.fromJson(json['channel2']) : null;
    channel3 =
        json['channel3'] != null ? Channel1.fromJson(json['channel3']) : null;
    matchId = json['match_id'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (channel1 != null) {
      data['channel1'] = channel1!.toJson();
    }
    if (channel2 != null) {
      data['channel2'] = channel2!.toJson();
    }
    if (channel3 != null) {
      data['channel3'] = channel3!.toJson();
    }
    data['match_id'] = matchId;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['id'] = id;
    return data;
  }
}

class Channel1 {
  bool? isIframe;
  String? link;

  Channel1({this.isIframe, this.link});

  Channel1.fromJson(Map<String, dynamic> json) {
    isIframe = json['is_iframe'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_iframe'] = isIframe;
    data['link'] = link;
    return data;
  }
}
