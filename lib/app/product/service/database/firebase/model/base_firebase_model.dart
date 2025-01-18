import 'package:cloud_firestore/cloud_firestore.dart';

 mixin  BaseFirebaseModel<T> {
  Map<String, dynamic> toJson();

  T fromJson(Map<String, dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseException(plugin: ''); // fixme
    }

    return fromJson(value);
  }
}
