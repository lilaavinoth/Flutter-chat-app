// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class chatModel {
  final String from;
  final String to;
  final String dateTime;
  final String message;
  chatModel({
    required this.from,
    required this.to,
    required this.dateTime,
    required this.message,
  });

  chatModel copyWith({
    String? from,
    String? to,
    String? dateTime,
    String? message,
  }) {
    return chatModel(
      from: from ?? this.from,
      to: to ?? this.to,
      dateTime: dateTime ?? this.dateTime,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'to': to,
      'dateTime': dateTime,
      'message': message,
    };
  }

  factory chatModel.fromMap(Map<String, dynamic> map) {
    return chatModel(
      from: map['from'] as String,
      to: map['to'] as String,
      dateTime: map['dateTime'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory chatModel.fromJson(String source) => chatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'chatModel(from: $from, to: $to, dateTime: $dateTime, message: $message)';
  }

  @override
  bool operator ==(covariant chatModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.from == from &&
      other.to == to &&
      other.dateTime == dateTime &&
      other.message == message;
  }

  @override
  int get hashCode {
    return from.hashCode ^
      to.hashCode ^
      dateTime.hashCode ^
      message.hashCode;
  }
}
