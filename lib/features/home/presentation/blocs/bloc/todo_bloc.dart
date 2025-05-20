import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_3/features/home/data/models/todo.dart';
import 'package:flutter_application_3/features/home/data/repositories/todo_repository.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  //calling repository
  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchTodoEvent>((event, emit) async {
      emit(FetchTodoLoading()); // emit the loading state
      // Fetch the todos from the repository
      final result = await todoRepository.fetchTodo();

      result.fold(
        (error) => emit(FetchTodoFail(error.errorMessage)),
        (success) => emit(
          FetchTodoLoaded(success),
        ), //from state we have FetchtodoLoaded is define
      );
    });
    on<AddTodoEvent>((event, emit) async {
      emit(AddTodoLoadingState());
      final response = await todoRepository.storeTodo(data: event.formData);
      response.fold(
        (error) => emit(AddTodoFailState(error.errorMessage)),
        //to show error message
        (success) => emit(AddTodSucessState(success)),
        //to show success message
      );
    });
  }
}
