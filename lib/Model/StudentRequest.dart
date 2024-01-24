
import 'package:cloud_firestore/cloud_firestore.dart';

class Request
{
   String userId;
   String dateTime;
   String type;
   String name;
   String status;
   String documentId;

  Request({
    required this.userId,
    required this.dateTime,
    required this.type,
    required this.name,
    required this.status,
    required this.documentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'dateTime': dateTime,
      'type': type,
      'name':name,
      'status':status,
      'documentId':documentId
    };
  }
  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      userId: map['userId'],
      dateTime: map['dateTime'] ,
      type: map['type'],
      name: map['name'],
      status: map['status'],
      documentId: map['documentId']
    );
  }
}