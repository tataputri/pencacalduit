class ModelMatch {
  int? matchId;
  int? leagueId;
  String? leagueName;
  String? leagueNameShort;
  String? matchDate;
  String? matchTime;
  String? startTime;
  int? homeId;
  String? homeName;
  String? homeLogo;
  int? homeScore;
  String? homeRank;
  int? homeYellowCard;
  int? homeRedCard;
  int? awayId;
  String? awayName;
  String? awayLogo;
  int? awayScore;
  String? awayRank;
  int? awayYellowCard;
  int? awayRedCard;
  String? stadiumName;
  String? temperatur;
  String? wheater;
  Live? live;

  ModelMatch(
      {this.matchId,
      this.leagueId,
      this.leagueName,
      this.leagueNameShort,
      this.matchDate,
      this.matchTime,
      this.startTime,
      this.homeId,
      this.homeName,
      this.homeLogo,
      this.homeScore,
      this.homeRank,
      this.homeYellowCard,
      this.homeRedCard,
      this.awayId,
      this.awayName,
      this.awayLogo,
      this.awayScore,
      this.awayRank,
      this.awayYellowCard,
      this.awayRedCard,
      this.stadiumName,
      this.temperatur,
      this.wheater,
      this.live});

  ModelMatch.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    leagueId = json['league_id'];
    leagueName = json['league_name'];
    leagueNameShort = json['league_name_short'];
    matchDate = json['match_date'];
    matchTime = json['match_time'];
    startTime = json['start_time'];
    homeId = json['home_id'];
    homeName = json['home_name'];
    homeLogo = json['home_logo'];
    homeScore = json['home_score'];
    homeRank = json['home_rank'];
    homeYellowCard = json['home_yellow_card'];
    homeRedCard = json['home_red_card'];
    awayId = json['away_id'];
    awayName = json['away_name'];
    awayLogo = json['away_logo'];
    awayScore = json['away_score'];
    awayRank = json['away_rank'];
    awayYellowCard = json['away_yellow_card'];
    awayRedCard = json['away_red_card'];
    stadiumName = json['stadium_name'];
    temperatur = json['temperatur'];
    wheater = json['wheater'];
    live = json['live'] != null ? Live.fromJson(json['live']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchId'] = matchId;
    data['league_id'] = leagueId;
    data['league_name'] = leagueName;
    data['league_name_short'] = leagueNameShort;
    data['match_date'] = matchDate;
    data['match_time'] = matchTime;
    data['start_time'] = startTime;
    data['home_id'] = homeId;
    data['home_name'] = homeName;
    data['home_logo'] = homeLogo;
    data['home_score'] = homeScore;
    data['home_rank'] = homeRank;
    data['home_yellow_card'] = homeYellowCard;
    data['home_red_card'] = homeRedCard;
    data['away_id'] = awayId;
    data['away_name'] = awayName;
    data['away_logo'] = awayLogo;
    data['away_score'] = awayScore;
    data['away_rank'] = awayRank;
    data['away_yellow_card'] = awayYellowCard;
    data['away_red_card'] = awayRedCard;
    data['stadium_name'] = stadiumName;
    data['temperatur'] = temperatur;
    data['wheater'] = wheater;
    if (live != null) {
      data['live'] = live!.toJson();
    }
    return data;
  }
}

class Live {
  String? status;
  String? url1;
  String? url2;
  String? thumb;
  String? animate;

  Live({this.status, this.url1, this.url2, this.thumb, this.animate});

  Live.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    url1 = json['url1'];
    url2 = json['url2'];
    thumb = json['thumb'];
    animate = json['animate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['url1'] = url1;
    data['url2'] = url2;
    data['thumb'] = thumb;
    data['animate'] = animate;
    return data;
  }
}
