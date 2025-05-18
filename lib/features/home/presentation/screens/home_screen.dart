import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants/app_routes.dart';
import 'package:flutter_application_3/features/home/presentation/blocs/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch todos on build
    context.read<TodoBloc>().add(FetchTodoEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        actions: [
          GestureDetector(
            onTap:
                () => Navigator.of(context).pushNamed(AppRoutes.addTodoScreen),

            child: Padding(
              padding: const EdgeInsets.only(right: 0),

              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is FetchTodoFail) {
            return Center(child: Text(state.errorMessage));
          } else if (state is FetchTodoLoaded) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: state.todo[index].isCompleted,
                        onChanged: (value) {
                          // Handle checkbox change
                        },
                      ),
                      title: Text(state.todo[index].title),
                      subtitle: Text(state.todo[index].description),
                      trailing: IconButton.filledTonal(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.todo.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
