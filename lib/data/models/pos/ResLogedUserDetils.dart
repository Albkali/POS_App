// To parse this JSON data, do
//
//     final resLogedUserDetils = resLogedUserDetilsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResLogedUserDetils resLogedUserDetilsFromJson(String str) => ResLogedUserDetils.fromJson(json.decode(str));

String resLogedUserDetilsToJson(ResLogedUserDetils data) => json.encode(data.toJson());

class ResLogedUserDetils {
  ResLogedUserDetils({
    required this.data,
  });

  List<ItemDetails> data;

  factory ResLogedUserDetils.fromJson(Map<String, dynamic> json) => ResLogedUserDetils(
    data: List<ItemDetails>.from(json["data"].map((x) => ItemDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ItemDetails {
  ItemDetails({
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
  String closedAt;
  String closingAmount;
  String totalCardSlips;
  String totalCheques;
  String denominations;
  String closingNote;
  String createdAt;
  String updatedAt;
  List<CashRegisterTransaction> cashRegisterTransactions;

  factory ItemDetails.fromJson(Map<String, dynamic> json) => ItemDetails(
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
    cashRegisterTransactions: List<CashRegisterTransaction>.from(json["cash_register_transactions"].map((x) => CashRegisterTransaction.fromJson(x))),
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
  String transactionId;
  String createdAt;
  String updatedAt;

  factory CashRegisterTransaction.fromJson(Map<String, dynamic> json) => CashRegisterTransaction(
    id: json["id"].toString(),
    cashRegisterId: json["cash_register_id"].toString(),
    amount: json["amount"].toString(),
    payMethod: json["pay_method"].toString(),
    type: json["type"].toString(),
    transactionType: json["transaction_type"].toString(),
    transactionId: json["transaction_id"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cash_register_id": cashRegisterId,
    "amount": amount,
    "pay_method": payMethod,
    "type": type,
    "transaction_type": transactionType,
    "transaction_id": transactionId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
