// To parse this JSON data, do
//
//     final resUsersPos = resUsersPosFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResUsersPos resUsersPosFromJson(String str) => ResUsersPos.fromJson(json.decode(str));

String resUsersPosToJson(ResUsersPos data) => json.encode(data.toJson());

class ResUsersPos {
  ResUsersPos({
    required this.data,
  });

  List<User> data;

  factory ResUsersPos.fromJson(Map<String, dynamic> json) => ResUsersPos(
    data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class User {
  User({
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
    required this.cashRegisterTransactions,
  });

  String id;
  String businessId;
  String locationId;
  String userId;
  String status;
  DateTime closedAt;
  String closingAmount;
  String totalCardSlips;
  String totalCheques;
  String denominations;
  String closingNote;
  DateTime createdAt;
  DateTime updatedAt;
  List<CashRegisterTransaction> cashRegisterTransactions;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"].toString(),
    businessId: json["business_id"].toString(),
    locationId: json["location_id"].toString(),
    userId: json["user_id"].toString(),
    status: json["status"].toString(),
    closedAt: DateTime.parse(json["closed_at"]),
    closingAmount: json["closing_amount"].toString(),
    totalCardSlips: json["total_card_slips"].toString(),
    totalCheques: json["total_cheques"].toString(),
    denominations: json["denominations"].toString(),
    closingNote: json["closing_note"].toString(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    cashRegisterTransactions: List<CashRegisterTransaction>.from(json["cash_register_transactions"].map((x) => CashRegisterTransaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "location_id": locationId,
    "user_id": userId,
    "status": status,
    "closed_at": closedAt.toIso8601String(),
    "closing_amount": closingAmount,
    "total_card_slips": totalCardSlips,
    "total_cheques": totalCheques,
    "denominations": denominations,
    "closing_note": closingNote,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "cash_register_transactions": List<dynamic>.from(cashRegisterTransactions.map((x) => x.toJson())),
  };
}

class CashRegisterTransaction {
  CashRegisterTransaction({
    required this.id,
    required this.cashRegisterId,
    required this.amount,
    required this.payMethod,
    required this.type,
    required this.transactionType,
    required this.transactionId,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String cashRegisterId;
  String amount;
  String payMethod;
  String type;
  String transactionType;
  int transactionId;
  DateTime createdAt;
  DateTime updatedAt;

  factory CashRegisterTransaction.fromJson(Map<String, dynamic> json) => CashRegisterTransaction(
    id: json["id"].toString(),
    cashRegisterId: json["cash_register_id"].toString(),
    amount: json["amount"].toString(),
    payMethod: json["pay_method"].toString(),
    type: json["type"].toString(),
    transactionType: json["transaction_type"].toString(),
    transactionId: json["transaction_id"] == null ? null : json["transaction_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cash_register_id": cashRegisterId,
    "amount": amount,
    "pay_method": payMethod,
    "type": type,
    "transaction_type": transactionType,
    "transaction_id": transactionId == null ? null : transactionId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
