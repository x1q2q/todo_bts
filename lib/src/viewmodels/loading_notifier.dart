import 'package:flutter/material.dart';

class LoadingNotifier with ChangeNotifier {
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMsg = '';
  String _message = '';

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMsg;
  String get message => _message;

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setError(bool hasError, String errMsg) {
    _hasError = hasError;
    _errorMsg = errMsg;
    notifyListeners();
  }

  void setMessage(String message) {
    _message = message;
    notifyListeners();
  }
}
