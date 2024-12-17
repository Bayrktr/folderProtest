import 'dart:math';

import 'package:uuid/uuid.dart';

final class IdGenerator {
  const IdGenerator._();

  static const Uuid uuid = Uuid();

  static String get randomStringId => uuid.v1();

  static int get randomIntId {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomNum = Random().nextInt(1000);
    final uniqueId = timestamp + randomNum;
    return uniqueId;
  }
}
