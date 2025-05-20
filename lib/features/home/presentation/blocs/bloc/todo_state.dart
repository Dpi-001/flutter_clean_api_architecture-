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

class AddTodoLoadingState extends TodoState {}

class AddTodSucessState extends TodoState {
  final String message;
  AddTodSucessState(this.message); //to show success message 1 this then event
}

class AddTodoFailState extends TodoState {
  final String message;
  AddTodoFailState(this.message); //to show error message
}
