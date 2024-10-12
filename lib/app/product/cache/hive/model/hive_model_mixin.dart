
import 'package:hive_flutter/hive_flutter.dart';


abstract class HiveManagerInitialModel {
}

/// The `HiveModelMixin` mixin in Dart is defining a mixin that adds a `key` property to classes that use it. The `key`
/// You have to register [T] your model in app initialize
/// You can use [DatabaseManager.initialze]
mixin HiveManagerMixin<T> on HiveManagerInitialModel {

  /// The `box` property is a Hive box of type `T` with the given key.
  late Box<T> box;

  /// The function `start` opens a Hive box of type `T` with the given key asynchronously.
  Future<void> start(String key) async {
    print(Hive.isBoxOpen(key));
    if (Hive.isBoxOpen(key)) return;
    box = await Hive.openBox<T>(
      key,
    );
    print('box tanımlandı ${T.toString()}');
  }

  /// The `clear` function clears all data in the `box`.
  Future<void> clear() => box.clear();
}