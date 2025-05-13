import 'package:flutter_application_3/features/home/data/models/todo.dart';

abstract class TodoDataSource {
  // This is an abstract class that defines the contract for a Todo data source.
  // It can be implemented by different classes to provide various data sources (e.g., local, remote).

  Future<List<Todo>>
  fetchTodo(); // Method to fetch a list of todos from the data source.
}

class TodoDataSourceImpl extends TodoDataSource {
  // This class implements the TodoDataSource interface and provides the actual implementation for fetching todos.

  @override
  Future<List<Todo>> fetchTodo() {
    // Simulating a network call with a delay
    throw UnimplementedError();

    // Returning a hardcoded list of Todo objects
  }
}
