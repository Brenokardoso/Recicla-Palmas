import 'dart:convert';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> jsonRead({required pathFile}) async {
  String jsonFile = await rootBundle.loadString(pathFile);
  Map<String, dynamic> jsonMap = jsonDecode(jsonFile);
  return jsonMap;
}
