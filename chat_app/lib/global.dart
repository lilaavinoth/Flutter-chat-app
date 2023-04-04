class MyData {
  static final MyData _singleton = MyData._internal();

  String _otheruser = '';
  String _you = '';
  String _uniqueConnectionid = '';

  factory MyData() {
    return _singleton;
  }

  MyData._internal();

  String get otheruser => _otheruser;
  String get you => _you;
  String get uniqueConnectionid => _uniqueConnectionid;

  void set otheruser(String newValue) {
    _otheruser = newValue;
  }

  void set you(String newValue) {
    _you = newValue;
  }

  void set uniqueConnectionid(String newValue) {
    _uniqueConnectionid = newValue;
  }
}
