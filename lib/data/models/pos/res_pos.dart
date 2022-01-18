// // To parse this JSON data, do
// //
// //     final resPos = resPosFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// ResPos resPosFromJson(String str) => ResPos.fromJson(json.decode(str));
//
// String resPosToJson(ResPos data) => json.encode(data.toJson());
//
// class ResPos {
//   ResPos({
//     required this.data,
//   });
//
//   Data data;
//
//   factory ResPos.fromJson(Map<String, dynamic> json) => ResPos(
//         data: Data.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }
//
// class Data {
//   Data(
//       {required this.status,
//       required this.locationId,
//       required this.createdAt,
//       required this.businessId,
//       required this.userId,
//       required this.updatedAt,
//       required this.id,
//       this.closingAmount});
//
//   String status;
//   String locationId;
//   String createdAt;
//   String businessId;
//   String userId;
//   String updatedAt;
//   String id;
//   String? closingAmount;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         status: json["status"].toString(),
//         locationId: json["location_id"].toString(),
//         createdAt: DateTime.parse(json["created_at"]).toString(),
//         businessId: json["business_id"].toString(),
//         userId: json["user_id"].toString(),
//         updatedAt: DateTime.parse(json["updated_at"]).toString(),
//         id: json["id"].toString(),
//         closingAmount: json["closing_amount"].toString(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "location_id": locationId,
//         "created_at": createdAt,
//         "business_id": businessId,
//         "user_id": userId,
//         "updated_at": updatedAt,
//         "id": id,
//         "closing_amount": closingAmount,
//       };
// }

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
  Data({
    required this.id,
    required this.businessId,
    required this.locationId,
    required this.userId,
    required this.status,
    required this.closedAt,
    required this.closingAmount,
    required this.totalCardSlips,
    required this.totalCheques,
    required this.denominations,
    required this.closingNote,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String businessId;
  String locationId;
  String userId;
  String status;
  String closedAt;
  String closingAmount;
  String totalCardSlips;
  String totalCheques;
  String denominations;
  String closingNote;
  String createdAt;
  String updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"].toString(),
        businessId: json["business_id"].toString(),
        locationId: json["location_id"].toString(),
        userId: json["user_id"].toString(),
        status: json["status"].toString(),
        closedAt: json["closed_at"].toString(),
        closingAmount: json["closing_amount"].toString(),
        totalCardSlips: json["total_card_slips"].toString(),
        totalCheques: json["total_cheques"].toString(),
        denominations: json["denominations"].toString(),
        closingNote: json["closing_note"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "location_id": locationId,
        "user_id": userId,
        "status": status,
        "closed_at": closedAt,
        "closing_amount": closingAmount,
        "total_card_slips": totalCardSlips,
        "total_cheques": totalCheques,
        "denominations": denominations,
        "closing_note": closingNote,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
