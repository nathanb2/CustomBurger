import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'Address.dart';


class User {
  int? userId;
  String firstName;
  String? lastName;
  String email;
  String password;
  String phone;
  String? token;
  Address? address;

  User({
    this.userId,
    required this.firstName,
    this.lastName,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}
