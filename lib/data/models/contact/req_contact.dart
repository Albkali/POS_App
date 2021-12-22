// To parse this JSON data, do
//
//     final reqConntact = reqConntactFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReqContact reqConntactFromJson(String str) => ReqContact.fromJson(json.decode(str));

String reqConntactToJson(ReqContact data) => json.encode(data.toJson());

class ReqContact {
  ReqContact({
    required this.type,
    required this.supplierBusinessName,
    required this.prefix,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.taxNumber,
    required this.payTermNumber,
    required this.payTermType,
    required this.mobile,
    required this.landline,
    required this.alternateNumber,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.customerGroupId,
    required this.contactId,
     this.dob,
    required this.customField1,
    required this.customField2,
    required this.customField3,
    required this.customField4,
    required this.email,
    required this.shippingAddress,
    required this.position,
    required this.openingBalance,
    required this.sourceId,
    required this.lifeStageId,
     this.assignedTo,
  });

  String type;
  String supplierBusinessName;
  String prefix;
  String firstName;
  String middleName;
  String lastName;
  String taxNumber;
  String payTermNumber;
  String payTermType;
  String mobile;
  String landline;
  String alternateNumber;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String country;
  String zipCode;
  String customerGroupId;
  String contactId;
  DateTime? dob;
  String customField1;
  String customField2;
  String customField3;
  String customField4;
  String email;
  String shippingAddress;
  String position;
  String openingBalance;
  String sourceId;
  String lifeStageId;
  List<dynamic>? assignedTo;

  factory ReqContact.fromJson(Map<String, dynamic> json) => ReqContact(
    type: json["type"].toString(),
    supplierBusinessName: json["supplier_business_name"].toString(),
    prefix: json["prefix"].toString(),
    firstName: json["first_name"].toString(),
    middleName: json["middle_name"].toString(),
    lastName: json["last_name"].toString(),
    taxNumber: json["tax_number"].toString(),
    payTermNumber: json["pay_term_number"].toString().toString(),
    payTermType: json["pay_term_type"].toString(),
    mobile: json["mobile"].toString(),
    landline: json["landline"].toString(),
    alternateNumber: json["alternate_number"].toString(),
    addressLine1: json["address_line_1"].toString(),
    addressLine2: json["address_line_2"].toString(),
    city: json["city"].toString(),
    state: json["state"].toString(),
    country: json["country"].toString(),
    zipCode: json["zip_code"].toString(),
    customerGroupId: json["customer_group_id"].toString(),
    contactId: json["contact_id"].toString(),
    dob: DateTime.parse(json["dob"]),
    customField1: json["custom_field1"].toString(),
    customField2: json["custom_field2"].toString(),
    customField3: json["custom_field3"].toString(),
    customField4: json["custom_field4"].toString(),
    email: json["email"].toString(),
    shippingAddress: json["shipping_address"].toString(),
    position: json["position"].toString(),
    openingBalance: json["opening_balance"].toString(),
    sourceId: json["source_id"].toString(),
    lifeStageId: json["life_stage_id"].toString(),
    assignedTo: List<dynamic>.from(json["assigned_to"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "supplier_business_name": supplierBusinessName,
    "prefix": prefix,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "tax_number": taxNumber,
    "pay_term_number": payTermNumber,
    "pay_term_type": payTermType,
    "mobile": mobile,
    "landline": landline,
    "alternate_number": alternateNumber,
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "city": city,
    "state": state,
    "country": country,
    "zip_code": zipCode,
    "customer_group_id": customerGroupId,
    "contact_id": contactId,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "custom_field1": customField1,
    "custom_field2": customField2,
    "custom_field3": customField3,
    "custom_field4": customField4,
    "email": email,
    "shipping_address": shippingAddress,
    "position": position,
    "opening_balance": openingBalance,
    "source_id": sourceId,
    "life_stage_id": lifeStageId,
    "assigned_to": List<dynamic>.from(assignedTo!.map((x) => x)),
  };
}
