import 'package:flutter/material.dart';
import '../model/request/SignInRequest.dart';

import '../repository/AuthRepo.dart';

class UserVM extends ChangeNotifier {
  final AuthRepo _repository = AuthRepo();
  SignInRequest _SignInRequest = SignInRequest();
  bool _isLoading = false;
  String _errorMessage = "";

  SignInRequest get signInRequest => _SignInRequest;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  UserVM();

  Future<void> signIn(void Function() onSuccess) async {
    _isLoading = true;
    notifyListeners();
    try {
      var user = await _repository.signIn(signInRequest);
      _errorMessage = "";
      onSuccess();
    } catch (e) {
      _errorMessage = 'Failed to create report: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
