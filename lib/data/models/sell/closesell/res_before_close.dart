
import 'dart:convert';

ResBeforeClose resBeforeCloseFromJson(String str) => ResBeforeClose.fromJson(json.decode(str));

String resBeforeCloseToJson(ResBeforeClose data) => json.encode(data.toJson());

class ResBeforeClose {
  ResBeforeClose({
    required this.data,
  });

  Data data;

  factory ResBeforeClose.fromJson(Map<String, dynamic> json) => ResBeforeClose(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.currentRegister,
    required this.firstTable,
    required this.secondTable,
    required this.thirdTable,
    required this.forthTable,
    required this.closingAmount,
    required this.totalCardSlips,
    required this.totalCheques,
  });

  String currentRegister;
  List<List<String>> firstTable;
  List<List<dynamic>> secondTable;
  List<ThirdTable> thirdTable;
  List<dynamic> forthTable;
  String closingAmount;
  String totalCardSlips;
  String totalCheques;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentRegister: json["current_register"].toString(),
    firstTable: List<List<String>>.from(json["first_table"].map((x) => List<String>.from(x.map((x) => x)))),
    secondTable: List<List<dynamic>>.from(json["second_table"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    thirdTable: List<ThirdTable>.from(json["third_table"].map((x) => ThirdTable.fromJson(x))),
    forthTable: List<dynamic>.from(json["forth_table"].map((x) => x)),
    closingAmount: json["closing_amount"].toString(),
    totalCardSlips: json["total_card_slips"].toString(),
    totalCheques: json["total_cheques"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "current_register": currentRegister,
    "first_table": List<dynamic>.from(firstTable.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "second_table": List<dynamic>.from(secondTable.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "third_table": List<dynamic>.from(thirdTable.map((x) => x.toJson())),
    "forth_table": List<dynamic>.from(forthTable.map((x) => x)),
    "closing_amount": closingAmount,
    "total_card_slips": totalCardSlips,
    "total_cheques": totalCheques,
  };
}

class ThirdTable {
  ThirdTable({
    required this.brandName,
    required this.totalQuantity,
    required this.totalAmount,
    required this.quantity,
     this.subTotal,
  });

  String brandName;
  String totalQuantity;
  String totalAmount;
  String quantity;
  List<List<String>>? subTotal;

  factory ThirdTable.fromJson(Map<String, dynamic> json) => ThirdTable(
    brandName: json["brand_name"].toString(),
    totalQuantity: json["total_quantity"].toString(),
    totalAmount: json["total_amount"].toString(),
    quantity: json["quantity"].toString(),
    subTotal: json["sub_total"] == null ? null : List<List<String>>.from(json["sub_total"].map((x) => List<String>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "brand_name": brandName,
    "total_quantity": totalQuantity,
    "total_amount": totalAmount,
    "quantity": quantity,
    "sub_total": subTotal == null ? null : List<dynamic>.from(subTotal!.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}
