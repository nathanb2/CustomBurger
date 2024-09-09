import 'dart:convert';

import '../model/User.dart';
import 'BaseService.dart';

class UserService extends BaseService {
  Future<List<User>> getUsersByCompany(int companyId) async {
    // Appel de l'API pour obtenir les utilisateurs par entreprise
    final response = await retryGet('/user/by-company/$companyId');
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      // Traite la réponse et renvoie la liste d'utilisateurs
      return (data).map((userJson) => User.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to retrieve users');
    }
  }

  Future<User> createUser(User user) async {
    // Appel de l'API pour créer un utilisateur
    final response = await retryPost('/user/register', user.toJson());
    if (response.statusCode == 201) {
      dynamic data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<void> updateUser(String userId, User updatedUser) async {
    // Appel de l'API pour mettre à jour un utilisateur
    final response = await retryPut('/user/$userId', updatedUser.toJson());
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(String userId) async {
    // Appel de l'API pour supprimer un utilisateur
    final response = await retryDelete('/user/$userId');
    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
