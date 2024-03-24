import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/snackbar.dart';
import 'package:flutter_application_1/models/ingredient.dart';
import 'package:flutter_application_1/pages/trackerpage.dart';
import 'package:flutter_application_1/services/UserApi.dart';
import 'package:http/http.dart' as http;

class IngridientApi {
  static List<Ingredient> expiredIngredients = [];
  static List<Ingredient> sevenDayExpireIngredients = [];
  static List<Ingredient> threeDayExpireIngredients = [];
  static List<Ingredient> todayExpireIngredients = [];

  static Future<void> createBatchIngredient(
      BuildContext context, List<Map<String, dynamic>> ingredientData) async {
    List<Map<String, dynamic>> body = ingredientData;
    try {
      final response = await http.post(
        Uri.parse(
            'https://sri-cusine-backend.onrender.com/api/v1/ingredients/batch'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(json.decode(response.body)['message']),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  static Future<void> getIngredient(
    BuildContext context,
  ) async {
    Map<String, dynamic> body = {
      'userId': UserApi.user.id,
    };
    expiredIngredients = [];
    sevenDayExpireIngredients = [];
    threeDayExpireIngredients = [];
    todayExpireIngredients = [];
    try {
      final response = await http.post(
        Uri.parse(
            'https://sri-cusine-backend.onrender.com/api/v1/ingredients/get/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['expiringToday'].isNotEmpty) {
          for (int i = 0; i < responseData['expiringToday'].length; i++) {
            todayExpireIngredients
                .add(Ingredient.fromJson(responseData['expiringToday'][i]));
          }
        }
        if (responseData['expiringIn3Days'].isNotEmpty) {
          for (int i = 0; i < responseData['expiringIn3Days'].length; i++) {
            threeDayExpireIngredients
                .add(Ingredient.fromJson(responseData['expiringIn3Days'][i]));
          }
        }
        if (responseData['expiringIn7Days'].isNotEmpty) {
          for (int i = 0; i < responseData['expiringIn7Days'].length; i++) {
            sevenDayExpireIngredients
                .add(Ingredient.fromJson(responseData['expiringIn7Days'][i]));
          }
        }
        if (responseData['expired'].isNotEmpty) {
          for (int i = 0; i < responseData['expired'].length; i++) {
            expiredIngredients
                .add(Ingredient.fromJson(responseData['expired'][i]));
          }
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TrackerPage()),
        );
        for (Ingredient ingredient in todayExpireIngredients) {
          print(ingredient.toJson());
        }
        for (Ingredient ingredient in threeDayExpireIngredients) {
          print(ingredient.toJson());
        }
        for (Ingredient ingredient in sevenDayExpireIngredients) {
          print(ingredient.toJson());
        }
        for (Ingredient ingredient in expiredIngredients) {
          print(ingredient.toJson());
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(json.decode(response.body)['message']),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }
}
