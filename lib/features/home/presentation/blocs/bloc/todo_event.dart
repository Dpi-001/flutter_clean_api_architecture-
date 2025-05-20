part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class FetchTodoEvent extends TodoEvent {
  // Event to fetch todos
}

class AddTodoEvent extends TodoEvent {
  // Event to add a new todo
  final Map<String, dynamic> formData;
  AddTodoEvent({
    required this.formData,
  }); //to pass data to the event and take data from user
}
