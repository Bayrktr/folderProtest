enum FirestoreCollection {
  users('users'),
  files('files'),
  ;

  const FirestoreCollection(this._value);

  final String _value;


  String get path => _value;
}
