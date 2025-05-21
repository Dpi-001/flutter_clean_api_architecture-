import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_3/core/api/api_calls.dart';
import 'package:flutter_application_3/features/home/data/models/todo.dart';

abstract class TodoDataSource {
  // This is an abstract class that defines the contract for a Todo data source.
  // It can be implemented by different classes to provide various data sources (e.g., local, remote).

  Future<List<Todo>> fetchTodo();
  // Method to fetch a list of todos from the data source.
  Future<String> storeTodo({required Map<String, dynamic> data});
}

class TodoDataSourceImpl extends TodoDataSource {
  // This class implements the TodoDataSource interface and provides the actual implementation for fetching todos.
  final ApiCalls apiCalls;
  TodoDataSourceImpl({required this.apiCalls});

  @override
  Future<List<Todo>> fetchTodo() async {
    // Simulating a network call with a delay
    final result = await apiCalls.getData(endpoint: "todo") as List;
    // Fetching data from the API using the ApiCalls class
    return result
        .map((todo) => Todo.fromMap(todo))
        .toList(); //mapping the result to a list of Todo objects
    //  return result.map((todo) => Todo.fromMap(todo))    .toList(); in loop can be show

    // Returning a hardcoded list of Todo objectsa
  }

  @override
  Future<String> storeTodo({required Map<String, dynamic> data}) async {
    // Simulating a network call with a delay
    final response = await apiCalls.sendData(endpoint: "todo", data: data);
    return response('message');
  }
}
