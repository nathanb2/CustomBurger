import '../model/User.dart';
import '../model/request/SignInRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/response/SignInResponse.dart';
import '../service/AuthService.dart';

class AuthRepo {
  final AuthService _authService = AuthService();

  SharedPreferences? prefs;

  Future<void> storeUser(User user) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs!.setString('token', user.token!);
    await prefs!.setString('username', user.firstName);
    await prefs!.setString('email', user.email);
    await prefs!.setInt('userId', user.userId??-1);
  }

  Future<User?> signIn(SignInRequest signInRequest) async {
    try {
      final user = await _authService.signIn(signInRequest);
      if (user != null && user.token != null) {
        storeUser(user);
        return user;
      }else{
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      // Handle error or rethrow
      throw Exception('Failed to signIn: $e');
    }
  }

}
