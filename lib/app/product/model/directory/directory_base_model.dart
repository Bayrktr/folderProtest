import 'package:DocuSort/app/product/service/database/firebase/model/base_firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DirectoryImplementBaseModel<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

abstract class DirectoryExtendBaseModel {
  int? id;
  String? name;
  int? fileListKey;
}

abstract class DirectoryFirebaseModel<T> extends DirectoryExtendBaseModel
    implements BaseFirebaseModel<T> {
  @override
  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseException(plugin: 'firebase_firestore', code: 'data-null');
    }

    return fromJson(value);
  }
}