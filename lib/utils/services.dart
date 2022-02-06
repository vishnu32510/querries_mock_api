import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future getMethod({required String url}) async {
  try {
    var response = await http.get(Uri.parse(url));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return false;
    }
  } catch (_) {
    return false;
  }
}
