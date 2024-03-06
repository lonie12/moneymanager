import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(
      json.decode(str),
    );

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  dynamic status;
  bool error;
  dynamic message;
  dynamic data;
  dynamic exception;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: (json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": status,
        "error": error,
        "message": message,
        "data": data,
      };
}
