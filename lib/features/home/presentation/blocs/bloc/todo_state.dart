part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class FetchTodoLoading extends TodoState {}

class FetchTodoLoaded extends TodoState {
  final List<Todo> todo;
  FetchTodoLoaded(this.todo);
}

class FetchTodoFail extends TodoState {
  final String errorMessage;
  FetchTodoFail(this.errorMessage);
}
