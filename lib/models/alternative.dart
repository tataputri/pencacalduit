class ModelAlternative {
  String? result;
  List<Data>? data;

  ModelAlternative({this.result, this.data});

  ModelAlternative.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? hari;
  String? jam;
  String? club;
  Link? link;

  Data({this.id, this.hari, this.jam, this.club, this.link});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hari = json['hari'];
    jam = json['jam'];
    club = json['club'];
    link = json['link'] != null ? Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hari'] = hari;
    data['jam'] = jam;
    data['club'] = club;
    if (link != null) {
      data['link'] = link!.toJson();
    }
    return data;
  }
}

class Link {
  Server1? server1;
  Server1? server2;
  Server1? server3;
  Server4? server4;

  Link({this.server1, this.server2, this.server3, this.server4});

  Link.fromJson(Map<String, dynamic> json) {
    server1 =
        json['server1'] != null ? Server1.fromJson(json['server1']) : null;
    server2 =
        json['server2'] != null ? Server1.fromJson(json['server2']) : null;
    server3 =
        json['server3'] != null ? Server1.fromJson(json['server3']) : null;
    server4 =
        json['server4'] != null ? Server4.fromJson(json['server4']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (server1 != null) {
      data['server1'] = server1!.toJson();
    }
    if (server2 != null) {
      data['server2'] = server2!.toJson();
    }
    if (server3 != null) {
      data['server3'] = server3!.toJson();
    }
    if (server4 != null) {
      data['server4'] = server4!.toJson();
    }
    return data;
  }
}

class Server1 {
  String? link;
  String? bahasa;

  Server1({this.link, this.bahasa});

  Server1.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    bahasa = json['bahasa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['bahasa'] = bahasa;
    return data;
  }
}

class Server4 {
  String? link;
  String? bahasa;

  Server4({this.link, this.bahasa});

  Server4.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    bahasa = json['bahasa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['bahasa'] = bahasa;
    return data;
  }
}
