import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetPost {
  Future<List<dynamic>?> getUserPosts(String id) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://hacknich.pythonanywhere.com/login/profileposts/${id}/'),
          headers: {"Authorization": "Token ${GetStorage().read('token')}"});

      print(response.body);
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return body;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
