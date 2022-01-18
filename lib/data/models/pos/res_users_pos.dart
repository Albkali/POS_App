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
    required this.type,
    required this.supplierBusinessName,
    required this.name,
    required this.prefix,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.contactId,
    required this.contactStatus,
    required this.taxNumber,
    required this.city,
    required this.state,
    required this.country,
    required this.addressLine1,
    required this.addressLine2,
    required this.zipCode,
    required this.dob,
    required this.mobile,
    required this.landline,
    required this.alternateNumber,
    required this.payTermNumber,
    required this.payTermType,
    required this.creditLimit,
    required this.createdBy,
    required this.balance,
    required this.totalRp,
    required this.totalRpUsed,
    required this.totalRpExpired,
    required this.isDefault,
    required this.shippingAddress,
    required this.shippingCustomFieldDetails,
    required this.isExport,
    required this.exportCustomField1,
    required this.exportCustomField2,
    required this.exportCustomField3,
    required this.exportCustomField4,
    required this.exportCustomField5,
    required this.exportCustomField6,
    required this.position,
    required this.customerGroupId,
    required this.customField1,
    required this.customField2,
    required this.customField3,
    required this.customField4,
    required this.customField5,
    required this.customField6,
    required this.customField7,
    required this.customField8,
    required this.customField9,
    required this.customField10,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String businessId;
  String type;
  String supplierBusinessName;
  String name;
  String prefix;
  String firstName;
  String middleName;
  String lastName;
  String email;
  String contactId;
  String contactStatus;
  String taxNumber;
  String city;
  String state;
  String country;
  String addressLine1;
  String addressLine2;
  String zipCode;
  String dob;
  String mobile;
  String landline;
  String alternateNumber;
  String payTermNumber;
  String payTermType;
  String creditLimit;
  String createdBy;
  String balance;
  String totalRp;
  String totalRpUsed;
  String totalRpExpired;
  String isDefault;
  String shippingAddress;
  String shippingCustomFieldDetails;
  String isExport;
  String exportCustomField1;
  String exportCustomField2;
  String exportCustomField3;
  String exportCustomField4;
  String exportCustomField5;
  String exportCustomField6;
  String position;
  String customerGroupId;
  String customField1;
  String customField2;
  String customField3;
  String customField4;
  String customField5;
  String customField6;
  String customField7;
  String customField8;
  String customField9;
  String customField10;
  String deletedAt;
  String createdAt;
  String updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"].toString(),
    businessId: json["business_id"].toString(),
    type: json["type"].toString(),
    supplierBusinessName: json["supplier_business_name"].toString(),
    name: json["name"].toString(),
    prefix: json["prefix"].toString(),
    firstName: json["first_name"].toString(),
    middleName: json["middle_name"].toString(),
    lastName: json["last_name"].toString(),
    email: json["email"].toString(),
    contactId: json["contact_id"].toString(),
    contactStatus: json["contact_status"].toString(),
    taxNumber: json["tax_number"].toString(),
    city: json["city"].toString(),
    state: json["state"].toString(),
    country: json["country"].toString(),
    addressLine1: json["address_line_1"].toString(),
    addressLine2: json["address_line_2"].toString(),
    zipCode: json["zip_code"].toString(),
    dob: json["dob"].toString(),
    mobile: json["mobile"].toString(),
    landline: json["landline"].toString(),
    alternateNumber: json["alternate_number"].toString(),
    payTermNumber: json["pay_term_number"].toString(),
    payTermType: json["pay_term_type"].toString(),
    creditLimit: json["credit_limit"].toString(),
    createdBy: json["created_by"].toString(),
    balance: json["balance"].toString(),
    totalRp: json["total_rp"].toString(),
    totalRpUsed: json["total_rp_used"].toString(),
    totalRpExpired: json["total_rp_expired"].toString(),
    isDefault: json["is_default"].toString(),
    shippingAddress: json["shipping_address"].toString(),
    shippingCustomFieldDetails: json["shipping_custom_field_details"].toString(),
    isExport: json["is_export"].toString(),
    exportCustomField1: json["export_custom_field_1"].toString(),
    exportCustomField2: json["export_custom_field_2"].toString(),
    exportCustomField3: json["export_custom_field_3"].toString(),
    exportCustomField4: json["export_custom_field_4"].toString(),
    exportCustomField5: json["export_custom_field_5"].toString(),
    exportCustomField6: json["export_custom_field_6"].toString(),
    position: json["position"].toString(),
    customerGroupId: json["customer_group_id"].toString(),
    customField1: json["custom_field1"].toString(),
    customField2: json["custom_field2"].toString(),
    customField3: json["custom_field3"].toString(),
    customField4: json["custom_field4"].toString(),
    customField5: json["custom_field5"].toString(),
    customField6: json["custom_field6"].toString(),
    customField7: json["custom_field7"].toString(),
    customField8: json["custom_field8"].toString(),
    customField9: json["custom_field9"].toString(),
    customField10: json["custom_field10"].toString(),
    deletedAt: json["deleted_at"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "type": type,
    "supplier_business_name": supplierBusinessName,
    "name": name,
    "prefix": prefix,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "email": email,
    "contact_id": contactId,
    "contact_status": contactStatus,
    "tax_number": taxNumber,
    "city": city,
    "state": state,
    "country": country,
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "zip_code": zipCode,
    "dob": dob,
    "mobile": mobile,
    "landline": landline,
    "alternate_number": alternateNumber,
    "pay_term_number": payTermNumber,
    "pay_term_type": payTermType,
    "credit_limit": creditLimit,
    "created_by": createdBy,
    "balance": balance,
    "total_rp": totalRp,
    "total_rp_used": totalRpUsed,
    "total_rp_expired": totalRpExpired,
    "is_default": isDefault,
    "shipping_address": shippingAddress,
    "shipping_custom_field_details": shippingCustomFieldDetails,
    "is_export": isExport,
    "export_custom_field_1": exportCustomField1,
    "export_custom_field_2": exportCustomField2,
    "export_custom_field_3": exportCustomField3,
    "export_custom_field_4": exportCustomField4,
    "export_custom_field_5": exportCustomField5,
    "export_custom_field_6": exportCustomField6,
    "position": position,
    "customer_group_id": customerGroupId,
    "custom_field1": customField1,
    "custom_field2": customField2,
    "custom_field3": customField3,
    "custom_field4": customField4,
    "custom_field5": customField5,
    "custom_field6": customField6,
    "custom_field7": customField7,
    "custom_field8": customField8,
    "custom_field9": customField9,
    "custom_field10": customField10,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}



// // To parse this JSON data, do
// //
// //     final resUsersPos = resUsersPosFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// ResUsersPos resUsersPosFromJson(String str) => ResUsersPos.fromJson(json.decode(str));
//
// String resUsersPosToJson(ResUsersPos data) => json.encode(data.toJson());
//
// class ResUsersPos {
//   ResUsersPos({
//     required this.data,
//   });
//
//   List<User> data;
//
//   factory ResUsersPos.fromJson(Map<String, dynamic> json) => ResUsersPos(
//     data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class User {
//   User({
//     required this.id,
//     required this.businessId,
//     required this.locationId,
//     required this.userId,
//     required this.status,
//     required this.closedAt,
//     required this.closingAmount,
//     required this.totalCardSlips,
//     required this.totalCheques,
//     required this.denominations,
//     required this.closingNote,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.cashRegisterTransactions,
//   });
//
//   String id;
//   String businessId;
//   String locationId;
//   String userId;
//   String status;
//   String closedAt;
//   String closingAmount;
//   String totalCardSlips;
//   String totalCheques;
//   String denominations;
//   String closingNote;
//   String createdAt;
//   String updatedAt;
//   List<CashRegisterTransaction> cashRegisterTransactions;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"].toString(),
//     businessId: json["business_id"].toString(),
//     locationId: json["location_id"].toString(),
//     userId: json["user_id"].toString(),
//     status: json["status"].toString(),
//     closedAt: json["closed_at"].toString(),
//     closingAmount: json["closing_amount"].toString(),
//     totalCardSlips: json["total_card_slips"].toString(),
//     totalCheques: json["total_cheques"].toString(),
//     denominations: json["denominations"].toString(),
//     closingNote: json["closing_note"].toString(),
//     createdAt: json["created_at"].toString(),
//     updatedAt: json["updated_at"].toString(),
//     cashRegisterTransactions: List<CashRegisterTransaction>.from(json["cash_register_transactions"].map((x) => CashRegisterTransaction.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "business_id": businessId,
//     "location_id": locationId,
//     "user_id": userId,
//     "status": status,
//     "closed_at": closedAt,
//     "closing_amount": closingAmount,
//     "total_card_slips": totalCardSlips,
//     "total_cheques": totalCheques,
//     "denominations": denominations,
//     "closing_note": closingNote,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "cash_register_transactions": List<dynamic>.from(cashRegisterTransactions.map((x) => x.toJson())),
//   };
// }
//
// class CashRegisterTransaction {
//   CashRegisterTransaction({
//     required this.id,
//     required this.cashRegisterId,
//     required this.amount,
//     required this.payMethod,
//     required this.type,
//     required this.transactionType,
//     required this.transactionId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   String id;
//   String cashRegisterId;
//   String amount;
//   String payMethod;
//   String type;
//   String transactionType;
//   String transactionId;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory CashRegisterTransaction.fromJson(Map<String, dynamic> json) => CashRegisterTransaction(
//     id: json["id"].toString(),
//     cashRegisterId: json["cash_register_id"].toString(),
//     amount: json["amount"].toString(),
//     payMethod: json["pay_method"].toString(),
//     type: json["type"].toString(),
//     transactionType: json["transaction_type"].toString(),
//     transactionId:  json["transaction_id"].toString(),
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "cash_register_id": cashRegisterId,
//     "amount": amount,
//     "pay_method": payMethod,
//     "type": type,
//     "transaction_type": transactionType,
//     "transaction_id": transactionId ,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
