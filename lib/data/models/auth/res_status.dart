// To parse this JSON data, do
//
//     final resStatus = resStatusFromJson(jsonString);

import 'dart:convert';

ResStatus resStatusFromJson(String str) => ResStatus.fromJson(json.decode(str));

String resStatusToJson(ResStatus data) => json.encode(data.toJson());

class ResStatus {
  ResStatus({
    required this.status,
  });

  bool status;

  factory ResStatus.fromJson(Map<String, dynamic> json) => ResStatus(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
