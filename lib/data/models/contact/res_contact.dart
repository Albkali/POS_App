// To parse this JSON data, do
//
//     final resContact = resContactFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResContact resContactFromJson(String str) => ResContact.fromJson(json.decode(str));

String resContactToJson(ResContact data) => json.encode(data.toJson());

class ResContact {
  ResContact({
    required this.data,
  });

  Data data;

  factory ResContact.fromJson(Map<String, dynamic> json) => ResContact(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.type,
    required this.supplierBusinessName,
    required this.firstName,
    required this.mobile,
    required this.businessId,
    required this.createdBy,
    required this.creditLimit,
    required this.name,
    required this.contactId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String type;
  String supplierBusinessName;
  String firstName;
  String mobile;
  int businessId;
  int createdBy;
  dynamic creditLimit;
  String name;
  String contactId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json["type"],
    supplierBusinessName: json["supplier_business_name"],
    firstName: json["first_name"],
    mobile: json["mobile"],
    businessId: json["business_id"],
    createdBy: json["created_by"],
    creditLimit: json["credit_limit"],
    name: json["name"],
    contactId: json["contact_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "supplier_business_name": supplierBusinessName,
    "first_name": firstName,
    "mobile": mobile,
    "business_id": businessId,
    "created_by": createdBy,
    "credit_limit": creditLimit,
    "name": name,
    "contact_id": contactId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
