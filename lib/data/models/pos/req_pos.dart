// To parse this JSON data, do
//
//     final reqPos = reqPosFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReqPos reqPosFromJson(String str) => ReqPos.fromJson(json.decode(str));

String reqPosToJson(ReqPos data) => json.encode(data.toJson());

class ReqPos {
  ReqPos({
    required this.locationId,
    this.initialAmount,
    this.createdAt,
    required this.status,
    this.closingAmount,
    this.totalCardSlips,
    this.totalCheques,
    this.closingNote,
    this.transactionIds,
  });

  String locationId;
  String? initialAmount;
  String? createdAt;
  String status;
  String? closingAmount;
  String? totalCardSlips;
  String? totalCheques;
  String? closingNote;
  String? transactionIds;

  factory ReqPos.fromJson(Map<String, dynamic> json) => ReqPos(
    locationId: json["location_id"].toString(),
    initialAmount: json["initial_amount"].toString(),
    createdAt: json["created_at"].toString(),
    status: json["status"].toString(),
    closingAmount: json["closing_amount"].toString(),
    totalCardSlips: json["total_card_slips"].toString(),
    totalCheques: json["total_cheques"].toString(),
    closingNote: json["closing_note"].toString(),
    transactionIds: json["transaction_ids"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "initial_amount": initialAmount,
    "created_at": createdAt,
    "status": status,
    "closing_amount": closingAmount,
    "total_card_slips": totalCardSlips,
    "total_cheques": totalCheques,
    "closing_note": closingNote,
    "transaction_ids": transactionIds,
  };
}
