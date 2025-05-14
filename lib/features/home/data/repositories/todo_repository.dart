import 'package:dartz/dartz.dart';
import 'package:flutter_application_3/core/api/api_error.dart';
import 'package:flutter_application_3/features/home/data/models/todo.dart';
import 'package:flutter_application_3/features/home/data/sources/todo_data_source.dart';

abstract class TodoRepository {
  //mainly used for sucess and failure of api calls
  // This is an abstract class that defines the contract for a Todo repository.
  // It can be implemented by different classes to provide various data sources (e.g., local, remote).
  Future<Either<ApiError, List<Todo>>> fetchTodo(); // either from dartz package
}

class TodoRepositoryImpl extends TodoRepository {
  // This class implements the TodoRepository interface and provides the actual implementation for fetching todos.
  final TodoDataSource todoDataSource;

  TodoRepositoryImpl({required this.todoDataSource});

  @override
  Future<Either<ApiError, List<Todo>>> fetchTodo() async {
    // Simulating a network call with a delay
    try {
      final result = await todoDataSource.fetchTodo();
      return Right(result); // Return the result wrapped in a Right
    } catch (e) {
      return Left(
        ApiError(errorMessage: e.toString()),
      ); // Return an ApiError wrapped in a Left
    }
  }
}
