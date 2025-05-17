import 'package:flutter_application_3/core/api/api_calls.dart';
import 'package:flutter_application_3/features/home/data/repositories/todo_repository.dart';
import 'package:flutter_application_3/features/home/data/sources/todo_data_source.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
// Service locator for dependency injection
serviceLocator() {
  getIt.registerLazySingleton<ApiCalls>(() => ApiCalls());
  // datasourceregisterLazySingleton is used to register a singleton instance of a class

  getIt.registerLazySingleton<TodoDataSource>(
    () => TodoDataSourceImpl(apiCalls: getIt<ApiCalls>()),
  );

  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(todoDataSource: getIt<TodoDataSource>()),
  );
  //registerLazySingleton is used to register a singleton instance of a class
  //getIt<TodoDataSource>() is used to resolve the dependency of TodoDataSource
  // Registering the TodoRepositoryImpl with the TodoDataSource
  // This allows the repository to use the data source for fetching data
}
