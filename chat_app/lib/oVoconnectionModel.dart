// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class oVoconnectionModel {
  final String messageBody;
  final String sentby;
  final String sentto;
  final Timestamp dateTime;
  oVoconnectionModel({
    required this.messageBody,
    required this.sentby,
    required this.sentto,
    required this.dateTime,
  });
  

  oVoconnectionModel copyWith({
    String? messageBody,
    String? sentby,
    String? sentto,
    Timestamp? dateTime,
  }) {
    return oVoconnectionModel(
      messageBody: messageBody ?? this.messageBody,
      sentby: sentby ?? this.sentby,
      sentto: sentto ?? this.sentto,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageBody': messageBody,
      'sentby': sentby,
      'sentto': sentto,
      'dateTime': dateTime,
    };
  }

  String toJson() => json.encode(toMap());


  @override
  String toString() {
    return 'oVoconnectionModel(messageBody: $messageBody, sentby: $sentby, sentto: $sentto, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant oVoconnectionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.messageBody == messageBody &&
      other.sentby == sentby &&
      other.sentto == sentto &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return messageBody.hashCode ^
      sentby.hashCode ^
      sentto.hashCode ^
      dateTime.hashCode;
  }
}
