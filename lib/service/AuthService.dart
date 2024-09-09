import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_lunch/service/DummyDB.dart';
import '../model/User.dart';
import '../model/request/SignInRequest.dart';
import '../model/response/SignInResponse.dart';
import '../service/BaseService.dart';
import 'package:retry/retry.dart';

import '../Constants.dart';

class AuthService extends BaseService {

  Future<User?> signIn(SignInRequest request) async {
    return DummyDB().signIn(request);
  }

}