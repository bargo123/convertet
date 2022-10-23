import 'package:injectable/injectable.dart';

import 'object_box.dart';

@Singleton()
class DbOperations {
  DbOperations(this.objectBox);
  final ObjectBox objectBox;

  List<int> putData<T>(List<T> results) {
    try {
      final result = objectBox.store.box<T>();
      return result.putMany(results);
    } catch (e) {
      throw Exception("Database operation went wrong");
    }
  }

  List<T>? getAll<T>() {
    try {
      final result = objectBox.store.box<T>();
      return result.getAll();
    } catch (e) {
      throw Exception("Database operation went wrong");
    }
  }

  T? getOne<T>(int id) {
    try {
      final result = objectBox.store.box<T>();
      return result.get(id);
    } catch (e) {
      throw Exception("Database operation went wrong");
    }
  }

  int count<T>() {
    try {
      final result = objectBox.store.box<T>();
      return result.count(limit: 0);
    } catch (e) {
      throw Exception("Database operation went wrong");
    }
  }

  void remove<T>(int? id) {
    if (id == null) return;
    try {
      final result = objectBox.store.box<T>();
      result.remove(id);
    } catch (e) {
      throw Exception("Database operation went wrong");
    }
  }

  bool? contains<T>(int? id) {
    try {
      final result = objectBox.store.box<T>();
      return result.contains(id!);
    } catch (e) {
      throw Exception("Database operation went wrong");
    }
  }
}
