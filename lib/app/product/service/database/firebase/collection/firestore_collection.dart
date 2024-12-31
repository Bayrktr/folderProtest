enum FirestoreCollection {
  users('users'),
  directory('directory'),
  ;

  const FirestoreCollection(this._value);

  final String _value;


  String get path => _value;
}
