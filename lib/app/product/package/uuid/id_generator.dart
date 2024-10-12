import 'dart:math';

import 'package:uuid/uuid.dart';

final class IdGenerator {
  IdGenerator._();

  static const Uuid uuid = Uuid();

  static String get randomStringId => uuid.v1();

  static int get randomIntId {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int randomNum = Random().nextInt(1000);
    int uniqueId = timestamp + randomNum;
    return uniqueId;
  }
}
