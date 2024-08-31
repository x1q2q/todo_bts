import 'package:flutter/material.dart';
import 'package:todo_bts/src/models/todo.dart';
import 'package:todo_bts/src/services/todo_repositories.dart';

class TodoViewmodel with ChangeNotifier {
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMsg = '';
  String _message = '';

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMsg;
  String get message => _message;

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

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

  void setTodo(List<Todo>? todos) {
    _todos = todos!;
    setLoading(false);
    notifyListeners();
  }
}
