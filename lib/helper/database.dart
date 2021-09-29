import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference messageCollection =
      FirebaseFirestore.instance.collection('messages');

  Future<String> sendMessage(
    String message,
    String email,
    String subject,
    String name,
    DateTime time,
  ) async {
    return await messageCollection
        .add({
          'Name': name,
          'Email': email,
          'Subject': subject,
          "Message": message,
          "Time": time,
        })
        .then((value) => "Message sent")
        .catchError((error) => "Failed to add user: $error");
  }
}
