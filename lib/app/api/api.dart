import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moneymanager/app/api/response.dart';
import 'package:moneymanager/helper/helper.dart';

class ApiClient {
  // GET METHOD
  Future<List<dynamic>> get(String endpoint) async {
    final Uri uri = Uri.parse(
      '${Helper.apiUrl}/$endpoint',
    );

    final response = await http.get(
      uri,
      headers: {
        // 'Authorization': LocalStorage.token,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    // ApiResponse jsondata = ApiResponse.fromJson(
    //   json.decode(response.body),
    // );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return [];
    }
  }

  // POST METHOD
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    // print("Token: " + LocalStorage.token);
    final Uri uri = Uri.parse('${Helper.apiUrl}/$endpoint');

    final response = await http.post(
      uri,
      headers: {
        // 'Authorization': LocalStorage.token,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );

    ApiResponse jsondata = ApiResponse.fromJson(
      json.decode(response.body),
    );

    if (response.statusCode == 200) {
      return jsondata.data;
    } else {
      return {"error": true, "message": jsondata.message};
    }
  }
}
