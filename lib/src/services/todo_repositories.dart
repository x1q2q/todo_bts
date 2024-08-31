import 'package:flutter/material.dart';
import 'network.dart';
import '../models/todo.dart';
import '../models/item.dart';
import 'package:todo_bts/src/utils/constants.dart';

class TodoRepositories with ChangeNotifier {
  final NetworkService _networkService;

  TodoRepositories(this._networkService);

  Future<String> getToken() async {
    Map<String, String> bodyData = {
      'username': Core.username,
      'password': Core.passwd
    };
    final response = await _networkService.postData('login', bodyData);

    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      return result['token'];
    } else {
      throw Exception('Failed to fetch token');
    }
  }

  Future<List<Todo>> getTodo(String token) async {
    _networkService.setToken(token);
    final response = await _networkService.fetchData(Core.todo);
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      final List<dynamic> jsonResults = result['data'];
      print(jsonResults);
      List<Todo> todo = List.generate(jsonResults.length, (j) {
        return Todo.fromJson(jsonResults[j]);
      });
      return todo;
    } else {
      throw Exception('Failed to load todo data');
    }
  }

  Future<List<Item>> getItem(String token) async {
    _networkService.setToken(token);
    final response = await _networkService.fetchData(Core.todo);
    print(response);
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      final List<dynamic> jsonResults = result['data'];
      List<Item> items = List.generate(jsonResults.length, (j) {
        return Item.fromJson(jsonResults[j]);
      });
      return items;
    } else {
      throw Exception('Failed to load todo data');
    }
  }
}
