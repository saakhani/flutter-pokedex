import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../model/todo.dart';

class TodoService {
  Future<List<Todo>> getAllTodos() async {
    const url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
            id: e['id'],
            title: e['title'],
            userId: e['userId'],
            completed: e['completed']);
      }).toList();
      return todos;
    }
    return [];
  }
}
