import 'package:DocuSort/app/product/service/database/firebase/model/base_firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class FirebaseDatabase {
  FirebaseDatabase(FirebaseFirestore? firestore)
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  FirebaseFirestore get firestore => _firestore;

  Future<List<T?>?> fetchList<T extends BaseFirebaseModel<T>>(
    T data,
    CollectionReference reference,
  ) async {
    final response = await reference.withConverter<T?>(
      fromFirestore: (snapshot, option) {
        return data.fromFirebase(snapshot);
      },
      toFirestore: (value, option) {
        return {};
      },
    ).get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }
}
