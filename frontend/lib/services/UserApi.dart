import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/routes/api_routes.dart';

class UserApi {
  static const baseUrl = ApiRoutes.BASE_URL;

  Future<List<dynamic>> createUser(
      String userName, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + ApiRoutes.CREATE_USER),
        body: {
          'userName': userName,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        return jsonDecode(response.body);
      } else {
        // If the server returns an unexpected response, log the status code and response body.
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // If an error occurs, log the error message and throw an exception.
      print('Error: $e');
      throw Exception('Failed to load data: $e');
    }
  }
}
