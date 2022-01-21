import 'dart:convert';

List<ResCreateSellError> resCreateSellErrorFromJson(String str) =>
    List<ResCreateSellError>.from(
        json.decode(str).map((x) => ResCreateSellError.fromJson(x)));

String resCreateSellErrorToJson(List<ResCreateSellError> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResCreateSellError {
  ResCreateSellError({
    required this.headers,
    required this.original,
    required this.exception,
  });

  Headers headers;
  Original original;
  dynamic exception;

  factory ResCreateSellError.fromJson(Map<String, dynamic> json) =>
      ResCreateSellError(
        headers: Headers.fromJson(json["headers"]),
        original: Original.fromJson(json["original"]),
        exception: json["exception"],
      );

  Map<String, dynamic> toJson() => {
        "headers": headers.toJson(),
        "original": original.toJson(),
        "exception": exception,
      };
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers();

  Map<String, dynamic> toJson() => {};
}

class Original {
  Original({
    required this.error,
  });

  Error error;

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error.toJson(),
      };
}

class Error {
  Error({
    required this.message,
  });

  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
