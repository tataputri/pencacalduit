class ModelValidation {
  String? check;
  Ads? ads;
  RestApi? restApi;
  SystemApp? systemApp;
  SystemAds? systemAds;

  ModelValidation(
      {this.check, this.ads, this.restApi, this.systemApp, this.systemAds});

  ModelValidation.fromJson(Map<String, dynamic> json) {
    check = json['check'];
    ads = json['ads'] != null ? Ads.fromJson(json['ads']) : null;
    restApi = json['rest_api'] != null
        ? RestApi.fromJson(json['rest_api'])
        : null;
    systemApp = json['system_app'] != null
        ? SystemApp.fromJson(json['system_app'])
        : null;
    systemAds = json['system_ads'] != null
        ? SystemAds.fromJson(json['system_ads'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['check'] = check;
    if (ads != null) {
      data['ads'] = ads!.toJson();
    }
    if (restApi != null) {
      data['rest_api'] = restApi!.toJson();
    }
    if (systemApp != null) {
      data['system_app'] = systemApp!.toJson();
    }
    if (systemAds != null) {
      data['system_ads'] = systemAds!.toJson();
    }
    return data;
  }
}

class Ads {
  String? activeAds;
  int? interval;
  Admob? admob;
  Fan? fan;

  Ads({this.activeAds, this.interval, this.admob, this.fan});

  Ads.fromJson(Map<String, dynamic> json) {
    activeAds = json['active_ads'];
    interval = json['interval'];
    admob = json['admob'] != null ? Admob.fromJson(json['admob']) : null;
    fan = json['fan'] != null ? Fan.fromJson(json['fan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['active_ads'] = activeAds;
    data['interval'] = interval;
    if (admob != null) {
      data['admob'] = admob!.toJson();
    }
    if (fan != null) {
      data['fan'] = fan!.toJson();
    }
    return data;
  }
}

class Admob {
  String? admobBannerId;
  String? admobInterstitialId;
  String? admobNative;

  Admob({this.admobBannerId, this.admobInterstitialId, this.admobNative});

  Admob.fromJson(Map<String, dynamic> json) {
    admobBannerId = json['admob_banner_id'];
    admobInterstitialId = json['admob_interstitial_id'];
    admobNative = json['admob_native'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['admob_banner_id'] = admobBannerId;
    data['admob_interstitial_id'] = admobInterstitialId;
    data['admob_native'] = admobNative;
    return data;
  }
}

class Fan {
  String? fanBannerId;
  String? fanInterstitialId;
  String? fanNativeId;

  Fan({this.fanBannerId, this.fanInterstitialId, this.fanNativeId});

  Fan.fromJson(Map<String, dynamic> json) {
    fanBannerId = json['fan_banner_id'];
    fanInterstitialId = json['fan_interstitial_id'];
    fanNativeId = json['fan_native_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fan_banner_id'] = fanBannerId;
    data['fan_interstitial_id'] = fanInterstitialId;
    data['fan_native_id'] = fanNativeId;
    return data;
  }
}

class RestApi {
  String? baseUrl;
  String? xRapidapiHost;
  String? xRapidapiKey;
  String? endpointVideoInfo;
  String? endpointRegionList;
  String? endpointVideoByRegion;
  String? endpointSearchChallenge;
  String? endpointVideoBySearchChallenge;

  RestApi(
      {this.baseUrl,
      this.xRapidapiHost,
      this.xRapidapiKey,
      this.endpointVideoInfo,
      this.endpointRegionList,
      this.endpointVideoByRegion,
      this.endpointSearchChallenge,
      this.endpointVideoBySearchChallenge});

  RestApi.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    xRapidapiHost = json['x_rapidapi_host'];
    xRapidapiKey = json['x_rapidapi_key'];
    endpointVideoInfo = json['endpoint_video_info'];
    endpointRegionList = json['endpoint_region_list'];
    endpointVideoByRegion = json['endpoint_video_by_region'];
    endpointSearchChallenge = json['endpoint_search_challenge'];
    endpointVideoBySearchChallenge = json['endpoint_video_by_search_challenge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_url'] = baseUrl;
    data['x_rapidapi_host'] = xRapidapiHost;
    data['x_rapidapi_key'] = xRapidapiKey;
    data['endpoint_video_info'] = endpointVideoInfo;
    data['endpoint_region_list'] = endpointRegionList;
    data['endpoint_video_by_region'] = endpointVideoByRegion;
    data['endpoint_search_challenge'] = endpointSearchChallenge;
    data['endpoint_video_by_search_challenge'] =
        endpointVideoBySearchChallenge;
    return data;
  }
}

class SystemApp {
  bool? statusSystemApp;
  InfoRedirectSystemApp? infoRedirectSystemApp;

  SystemApp({this.statusSystemApp, this.infoRedirectSystemApp});

  SystemApp.fromJson(Map<String, dynamic> json) {
    statusSystemApp = json['status_system_app'];
    infoRedirectSystemApp = json['info_redirect_system_app'] != null
        ? InfoRedirectSystemApp.fromJson(json['info_redirect_system_app'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_system_app'] = statusSystemApp;
    if (infoRedirectSystemApp != null) {
      data['info_redirect_system_app'] = infoRedirectSystemApp!.toJson();
    }
    return data;
  }
}

class InfoRedirectSystemApp {
  String? title;
  String? imageurl;
  String? content;
  String? urlredirect;

  InfoRedirectSystemApp(
      {this.title, this.imageurl, this.content, this.urlredirect});

  InfoRedirectSystemApp.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageurl = json['imageurl'];
    content = json['content'];
    urlredirect = json['urlredirect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['imageurl'] = imageurl;
    data['content'] = content;
    data['urlredirect'] = urlredirect;
    return data;
  }
}

class SystemAds {
  bool? statusSystemAds;
  InfoRedirectSystemApp? infoRedirectSystemAds;

  SystemAds({this.statusSystemAds, this.infoRedirectSystemAds});

  SystemAds.fromJson(Map<String, dynamic> json) {
    statusSystemAds = json['status_system_ads'];
    infoRedirectSystemAds = json['info_redirect_system_ads'] != null
        ? InfoRedirectSystemApp.fromJson(json['info_redirect_system_ads'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_system_ads'] = statusSystemAds;
    if (infoRedirectSystemAds != null) {
      data['info_redirect_system_ads'] = infoRedirectSystemAds!.toJson();
    }
    return data;
  }
}
