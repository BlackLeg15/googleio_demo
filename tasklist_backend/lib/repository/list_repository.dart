import 'package:tasklist_backend/extensions/hash_extension.dart';
import 'package:tasklist_commons/tasklist_commons.dart';

class ListRepository {
  
  const ListRepository({this.listDb = const {}});
  
  final Map<String, TaskListModel> listDb;

  Future<TaskListModel?> getListById(String id) async {
    return listDb[id];
  }

  Map<String, dynamic> getAllLists() {
    return listDb.map((key, value) => MapEntry(key, value.toJson()));
  }

  String createList({required String name}) {
    final hashValue = name.hashValue;
    listDb[hashValue] = TaskListModel(id: hashValue, name: name);
    return hashValue;
  }

  void deleteList(String id) {
    listDb.remove(id);
  }

  void updateList({required String id, required String name}) {
    final list = listDb[id];

    if (list == null) {
      throw Exception('List not found');
    }

    listDb[id] = TaskListModel(id: id, name: name);
  }
}
