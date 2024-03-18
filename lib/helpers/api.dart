import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moneymanager/helpers/constants.dart';

class ApiClient {
  // GET METHOD
  Future<List<dynamic>> get(String endpoint) async {
    final Uri uri = Uri.parse(
      '$apiUrl/$endpoint',
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
}
