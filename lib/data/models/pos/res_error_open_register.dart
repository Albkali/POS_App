// To parse this JSON data, do
//
//     final resOpenRegError = resOpenRegErrorFromJson(jsonString);

import 'dart:convert';

ResOpenRegError resOpenRegErrorFromJson(String str) =>
    ResOpenRegError.fromJson(json.decode(str));

String resOpenRegErrorToJson(ResOpenRegError data) =>
    json.encode(data.toJson());

class ResOpenRegError {
  ResOpenRegError({
    required this.status,
    required this.message,
    required this.cashRegisterId,
  });

  String status;
  String message;
  String cashRegisterId;

  factory ResOpenRegError.fromJson(Map<String, dynamic> json) =>
      ResOpenRegError(
        status: json["status"].toString(),
        message: json["message"].toString(),
        cashRegisterId: json["cash_register_id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cash_register_id": cashRegisterId,
      };
}
