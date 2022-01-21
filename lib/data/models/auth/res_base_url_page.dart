import 'dart:convert';

ResBaseUrl resBaseUrlFromJson(String str) =>
    ResBaseUrl.fromJson(json.decode(str));

String resBaseUrlToJson(ResBaseUrl data) => json.encode(data.toJson());

class ResBaseUrl {
  ResBaseUrl({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory ResBaseUrl.fromJson(Map<String, dynamic> json) => ResBaseUrl(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.baseUrl,
    required this.clientSecret,
    required this.clientId,
    required this.otherData,
  });

  String baseUrl;
  String clientSecret;
  String clientId;
  OtherData otherData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseUrl: json["base_url"].toString(),
        clientSecret: json["client_secret"].toString(),
        clientId: json["client_id"].toString(),
        otherData: OtherData.fromJson(json["other_data"]),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "client_secret": clientSecret,
        "client_id": clientId,
        "other_data": otherData.toJson(),
      };
}

class OtherData {
  OtherData({
    required this.version,
    required this.versionMsg,
    required this.enable,
    required this.generalMsg,
  });

  String version;
  String versionMsg;
  bool enable;
  String generalMsg;

  factory OtherData.fromJson(Map<String, dynamic> json) => OtherData(
        version: json["version"].toString(),
        versionMsg: json["version_msg"].toString(),
        enable: json["enable"],
        generalMsg: json["general_msg"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "version_msg": versionMsg,
        "enable": enable,
        "general_msg": generalMsg,
      };
}
