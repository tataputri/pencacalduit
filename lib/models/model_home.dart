class ModelHome {
  String? result;
  List<DataBola>? data;

  ModelHome({this.result, this.data});

  ModelHome.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <DataBola>[];
      json['data'].forEach((v) {
        data!.add(DataBola.fromJson(v));
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

class DataBola {
  int? no;
  int? id;
  String? leagueName;
  String? leagueNameShort;
  String? home;
  int? homeScore;
  String? homeLogo;
  String? away;
  int? awayScore;
  String? awayLogo;
  String? matchTime;
  String? startTime;
  String? isLive;
  Link? link;

  DataBola(
      {this.no,
      this.id,
      this.leagueName,
      this.leagueNameShort,
      this.home,
      this.homeScore,
      this.homeLogo,
      this.away,
      this.awayScore,
      this.awayLogo,
      this.matchTime,
      this.startTime,
      this.isLive,
      this.link});

  DataBola.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    id = json['id'];
    leagueName = json['leagueName'];
    leagueNameShort = json['leagueNameShort'];
    home = json['home'];
    homeScore = json['homeScore'];
    homeLogo = json['homeLogo'];
    away = json['away'];
    awayScore = json['awayScore'];
    awayLogo = json['awayLogo'];
    matchTime = json['matchTime'];
    startTime = json['startTime'];
    isLive = json['isLive'];
    link = json['link'] != null ? Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['id'] = id;
    data['leagueName'] = leagueName;
    data['leagueNameShort'] = leagueNameShort;
    data['home'] = home;
    data['homeScore'] = homeScore;
    data['homeLogo'] = homeLogo;
    data['away'] = away;
    data['awayScore'] = awayScore;
    data['awayLogo'] = awayLogo;
    data['matchTime'] = matchTime;
    data['startTime'] = startTime;
    data['isLive'] = isLive;
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

  Link({this.server1, this.server2, this.server3});

  Link.fromJson(Map<String, dynamic> json) {
    server1 =
        json['server1'] != null ? Server1.fromJson(json['server1']) : null;
    server2 =
        json['server2'] != null ? Server1.fromJson(json['server2']) : null;
    server3 =
        json['server3'] != null ? Server1.fromJson(json['server3']) : null;
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
    return data;
  }
}

class Server1 {
  String? link;

  Server1({this.link});

  Server1.fromJson(Map<String, dynamic> json) {
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    return data;
  }
}
