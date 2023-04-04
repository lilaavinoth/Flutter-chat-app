// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class newUserRegisterModel {
  final String displayName;
  final String email;
  final String dateTime;
  newUserRegisterModel({
    required this.displayName,
    required this.email,
    required this.dateTime,
  });

  newUserRegisterModel copyWith({
    String? displayName,
    String? email,
    String? dateTime,
  }) {
    return newUserRegisterModel(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'dateTime': dateTime,
    };
  }

  factory newUserRegisterModel.fromMap(Map<String, dynamic> map) {
    return newUserRegisterModel(
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      dateTime: map['dateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory newUserRegisterModel.fromJson(String source) => newUserRegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'newUserRegisterModel(displayName: $displayName, email: $email, dateTime: $dateTime)';

  @override
  bool operator ==(covariant newUserRegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.displayName == displayName &&
      other.email == email &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode => displayName.hashCode ^ email.hashCode ^ dateTime.hashCode;
}
