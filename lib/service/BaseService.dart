import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';

class BaseService {

  SharedPreferences? prefs;
  String? url;

  Future<String?> getToken() async {
    prefs ??= await SharedPreferences.getInstance();
    return await prefs!.getString('token');
  }

  BaseService(){
    url = getUrl();
  }

  String getUrl() {
    if (kIsWeb) {
      return webBaseUrl;
    } else {
      return baseUrl;
    }
  }

  Future<http.Response> retryGet(String path) async {
    final String? token = await getToken();
    return _retry(() => http.get(Uri.parse('$url$path'),
    headers: <String, String>{'Authorization': 'Bearer $token'}));
  }

  Future<http.Response> retryGetWithParams(String path, {Map<String, String>? queryParameters}) async {
    final String? token = await getToken();
    return _retry(() => http.get(Uri.parse('$url$path'),
    headers: <String, String>{'Authorization': 'Bearer $token'}));
  }

  Future<http.Response> retryPost(String path, dynamic body) async {
    final String? token = await getToken();
    return _retry(() => http.post(
      Uri.parse('$url$path'),
      headers: <String, String>{'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'},
      body: jsonEncode(body),
    ));
  }

  Future<http.Response> retryPut(String path, dynamic body) async {
    final String? token = await getToken();
    return _retry(() => http.put(
      Uri.parse('$url$path'),
      headers: <String, String>{'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'},
      body: jsonEncode(body),
    ));
  }

  Future<http.Response> retryDelete(String path) async {
    final String? token = await getToken();
    return _retry(() => http.delete(Uri.parse('$url$path'),
      headers: <String, String>{'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'},));
  }

  Future<T> _retry<T>(Future<T> Function() fn) async {
    final retrier = RetryOptions(
      maxAttempts: maxRetryAttempts, // Number of retry attempts
      delayFactor: Duration(seconds: retryDelay)// Delay between retry attempts
    );
    return await retrier.retry<T>(() => fn());
  }
}
