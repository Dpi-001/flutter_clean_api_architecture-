import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/home/presentation/blocs/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is FetchTodoFail) {
            return Center(child: Text(state.errorMessage));
          } else if (state is FetchTodoLoaded) {
            return Center(child: Text("${state.todo.length}"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
