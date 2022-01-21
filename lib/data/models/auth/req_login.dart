import 'dart:convert';

ReqLogin reqLoginFromJson(String str) => ReqLogin.fromJson(json.decode(str));

String reqLoginToJson(ReqLogin data) => json.encode(data.toJson());

class ReqLogin {
  ReqLogin({
    required this.grantType,
    required this.clientId,
    required this.clientSecret,
    required this.username,
    required this.password,
  });

  String grantType;
  String clientId;
  String clientSecret;
  String username;
  String password;

  factory ReqLogin.fromJson(Map<String, dynamic> json) => ReqLogin(
    grantType: json["grant_type"],
    clientId: json["client_id"],
    clientSecret: json["client_secret"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "grant_type": grantType,
    "client_id": clientId,
    "client_secret": clientSecret,
    "username": username,
    "password": password,
  };
}
