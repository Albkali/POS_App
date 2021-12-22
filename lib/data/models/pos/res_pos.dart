// To parse this JSON data, do
//
//     final resPos = resPosFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResPos resPosFromJson(String str) => ResPos.fromJson(json.decode(str));

String resPosToJson(ResPos data) => json.encode(data.toJson());

class ResPos {
  ResPos({
    required this.data,
  });

  Data data;

  factory ResPos.fromJson(Map<String, dynamic> json) => ResPos(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data(
      {required this.status,
      required this.locationId,
      required this.createdAt,
      required this.businessId,
      required this.userId,
      required this.updatedAt,
      required this.id,
      this.closingAmount});

  String status;
  String locationId;
  String createdAt;
  String businessId;
  String userId;
  String updatedAt;
  String id;
  String? closingAmount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"].toString(),
        locationId: json["location_id"].toString(),
        createdAt: DateTime.parse(json["created_at"]).toString(),
        businessId: json["business_id"].toString(),
        userId: json["user_id"].toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
        id: json["id"].toString(),
        closingAmount: json["closing_amount"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "location_id": locationId,
        "created_at": createdAt,
        "business_id": businessId,
        "user_id": userId,
        "updated_at": updatedAt,
        "id": id,
        "closing_amount": closingAmount,
      };
}
