import 'package:hive_flutter/hive_flutter.dart';
import 'package:pdf_app/app/product/cache/hive/model/hive_model.dart';
import 'package:pdf_app/app/product/cache/hive/model/hive_model_mixin.dart';



class HiveDatabaseOperation<T extends HiveModelMixin>
    extends HiveManagerInitialModel with HiveManagerMixin<T> {

  Stream<Iterable<T>> streamItems() {
    return Stream.value(box.listenable()).map((event) => event.value.values);
  }


  /// The `getItem` function retrieves an item from a box using a given key and returns it, or returns null if the item does
  /// not exist.
  ///
  /// Args:
  ///   model (T): The `model` parameter is of type `T`, which represents the type of the item being added or updated in the
  /// box. It is used to store or update an item in the box using the provided key.
  Future<void> addOrUpdateItem(T model) => box.put(model.key, model);

  /// The function `getItem` retrieves an item from a box using a given key and returns it, or returns null if the item does
  /// not exist.
  ///
  /// Args:
  ///   key (String): The key is a string that is used to retrieve an item from a box.
  T? getItem(String key) => box.get(key);

  /// The function `deleteItem` deletes an item from a box using a given key.
  ///
  /// Args:
  ///   key (String): The key is a string that represents the unique identifier of the item to be deleted from the box.
  Future<void> deleteItem(String key) => box.delete(key);
}