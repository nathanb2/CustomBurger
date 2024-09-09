
import 'package:shared_preferences/shared_preferences.dart';

import '../model/User.dart';
import '../service/UserService.dart';

class UserRepo {
  final UserService _userService = UserService();

  SharedPreferences? prefs;

  Future<int?> getCompanyId() async {
    prefs ??= await SharedPreferences.getInstance();
    return await prefs!.getInt('companyId');
  }


  Future<List<User>> getUsersByCompany() async {
    int? companyId = await getCompanyId();
    return await _userService.getUsersByCompany(companyId!);
  }

  Future<User> createUser(User user) async {
    return await _userService.createUser(user);
  }

  Future<void> updateUser(String userId, User updatedUser) async {
    await _userService.updateUser(userId, updatedUser);
  }

  Future<void> deleteUser(String userId) async {
    await _userService.deleteUser(userId);
  }
}
