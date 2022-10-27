class ModelValidation {
  bool? isOpen;
  Ad? ad;
  SystemAds? systemAds;
  SystemAds? systemApp;

  ModelValidation({this.isOpen, this.ad, this.systemAds, this.systemApp});

  ModelValidation.fromJson(Map<String, dynamic> json) {
    isOpen = json['isOpen'];
    ad = json['ad'] != null ? Ad.fromJson(json['ad']) : null;
    systemAds = json['system_ads'] != null
        ? SystemAds.fromJson(json['system_ads'])
        : null;
    systemApp = json['system_app'] != null
        ? SystemAds.fromJson(json['system_app'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isOpen'] = isOpen;
    if (ad != null) {
      data['ad'] = ad!.toJson();
    }
    if (systemAds != null) {
      data['system_ads'] = systemAds!.toJson();
    }
    if (systemApp != null) {
      data['system_app'] = systemApp!.toJson();
    }
    return data;
  }
}

class Ad {
  String? adActive;
  int? adInterval;
  Admob? admob;
  Admob? fan;
  Applovin? applovin;

  Ad({this.adActive, this.adInterval, this.admob, this.fan, this.applovin});

  Ad.fromJson(Map<String, dynamic> json) {
    adActive = json['ad_active'];
    adInterval = json['ad_interval'];
    admob = json['admob'] != null ? Admob.fromJson(json['admob']) : null;
    fan = json['fan'] != null ? Admob.fromJson(json['fan']) : null;
    applovin = json['applovin'] != null
        ? Applovin.fromJson(json['applovin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_active'] = adActive;
    data['ad_interval'] = adInterval;
    if (admob != null) {
      data['admob'] = admob!.toJson();
    }
    if (fan != null) {
      data['fan'] = fan!.toJson();
    }
    if (applovin != null) {
      data['applovin'] = applovin!.toJson();
    }
    return data;
  }
}

class Admob {
  Banner? banner;
  Banner? interstitial;
  Banner? native;

  Admob({this.banner, this.interstitial, this.native});

  Admob.fromJson(Map<String, dynamic> json) {
    banner =
        json['banner'] != null ? Banner.fromJson(json['banner']) : null;
    interstitial = json['interstitial'] != null
        ? Banner.fromJson(json['interstitial'])
        : null;
    native =
        json['native'] != null ? Banner.fromJson(json['native']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banner != null) {
      data['banner'] = banner!.toJson();
    }
    if (interstitial != null) {
      data['interstitial'] = interstitial!.toJson();
    }
    if (native != null) {
      data['native'] = native!.toJson();
    }
    return data;
  }
}

class Banner {
  bool? status;
  String? adUnit;

  Banner({this.status, this.adUnit});

  Banner.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    adUnit = json['ad_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['ad_unit'] = adUnit;
    return data;
  }
}

class Applovin {
  Banner? banner;
  Banner? interstitial;
  Banner? native;
  Banner? mrec;

  Applovin({this.banner, this.interstitial, this.native, this.mrec});

  Applovin.fromJson(Map<String, dynamic> json) {
    banner =
        json['banner'] != null ? Banner.fromJson(json['banner']) : null;
    interstitial = json['interstitial'] != null
        ? Banner.fromJson(json['interstitial'])
        : null;
    native =
        json['native'] != null ? Banner.fromJson(json['native']) : null;
    mrec = json['mrec'] != null ? Banner.fromJson(json['mrec']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banner != null) {
      data['banner'] = banner!.toJson();
    }
    if (interstitial != null) {
      data['interstitial'] = interstitial!.toJson();
    }
    if (native != null) {
      data['native'] = native!.toJson();
    }
    if (mrec != null) {
      data['mrec'] = mrec!.toJson();
    }
    return data;
  }
}

class SystemAds {
  bool? status;
  String? title;
  String? content;
  String? image;
  String? url;

  SystemAds({this.status, this.title, this.content, this.image, this.url});

  SystemAds.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}
