// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../services/todo_service.dart';

// final serviceProvider = StateProvider<TodoService>((ref) {
//   return TodoService();
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/todo_service.dart';

/// A provider that holds a singleton instance of TodoService.
final serviceProvider = StateProvider<TodoService>((ref) {
  // Create and return an instance of TodoService.
  return TodoService();
});
