import 'package:tasklist_backend/extensions/hash_extension.dart';
import 'package:tasklist_commons/tasklist_commons.dart';

class ItemRepository {
  const ItemRepository({this.itemDb = const {}});

  final Map<String, TaskItemModel> itemDb;

  Future<TaskItemModel?> getItemById(String id) async {
    return itemDb[id];
  }

  Map<String, dynamic> getAllItems() {
    return itemDb.map((key, value) => MapEntry(key, value.toJson()));
  }

  String createItem({
    required String name,
    required String listId,
    required String description,
    required bool status,
  }) {
    final hashValue = name.hashValue;
    itemDb[hashValue] = TaskItemModel(
      id: hashValue,
      name: name,
      listId: listId,
      description: description,
      status: status,
    );
    return hashValue;
  }

  void deleteItem(String id) {
    itemDb.remove(id);
  }

  void updateItem({
    required String id,
    required String name,
    required String listId,
    required String description,
    required bool status,
  }) {
    final item = itemDb[id];

    if (item == null) {
      throw Exception('Item not found');
    }

    itemDb[id] = TaskItemModel(
      id: id,
      name: name,
      description: description,
      listId: listId,
      status: status,
    );
  }
}
