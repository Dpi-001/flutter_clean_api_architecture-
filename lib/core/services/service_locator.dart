import 'package:flutter_application_3/core/api/api_calls.dart';
import 'package:flutter_application_3/features/home/data/repositories/todo_repository.dart';
import 'package:flutter_application_3/features/home/data/sources/todo_data_source.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
// Service locator for dependency injection
serviceLocator() {
  getIt.registerLazySingleton<ApiCalls>(getIt<ApiCalls>);
  // datasourceregisterLazySingleton is used to register a singleton instance of a class

  getIt.registerLazySingleton<TodoDataSource>(getIt<TodoDataSource>);

  getIt.registerLazySingleton<TodoRepository>(getIt<TodoRepository>);
}
