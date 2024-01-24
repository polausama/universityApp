import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:university_app/Constants.dart';


class StudentController
{


  Future<List<Map<String, dynamic>>> getStudentsInClass(String classId) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('classRegistration')
          .where('class_id', isEqualTo: FirebaseFirestore.instance.doc('classes/$classId'))
          .get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error fetching students in class: $e');
      return [];
    }
  }


  Future<List<Map<String, dynamic>>> getExcusesForClass(String classId) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('excuses')
          .where('class_id', isEqualTo: FirebaseFirestore.instance.doc('classes/$classId'))
          .get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error fetching excuses for class: $e');
      return [];
    }
  }

  Future<void> submitExcuse(String classId, String studentId, String message, String pdfUrl) async {
    try {
      await FirebaseFirestore.instance.collection('excuses').add({
        'class_id': FirebaseFirestore.instance.doc('classes/$classId'),
        'student_id': FirebaseFirestore.instance.doc('users/$studentId'),
        'status': 'Pending',
        'date': Timestamp.now(),
        'message': message,
        'pdf_url': pdfUrl,
      });
    } catch (e) {
      print('Error submitting excuse: $e');
    }
  }

  Future<String> uploadFile(String path, String fileName, Uint8List fileData) async {
    final Reference reference = FirebaseStorage.instance.ref().child(path).child(fileName);
    final UploadTask uploadTask = reference.putData(fileData);
    await uploadTask;
    return await reference.getDownloadURL();
  }

  Future<dynamic> getClassesForStudentByEmail() async {
    try {
      String E=constantsVaribles.email;
      // Step 1: Find the student's document by email
      final QuerySnapshot studentQuerySnapshot = await FirebaseFirestore.instance.collection('users')
          .where('type', isEqualTo: 'student')
          .where('email', isEqualTo: E)
          .get();

      // Step 2: Check if a student with the provided email exists
      if (studentQuerySnapshot.docs.isEmpty) {
        constantsVaribles.studentClasses=null;
      }

      // Step 3: Get the student's document ID
      final String studentId = studentQuerySnapshot.docs.first.id;

      // Step 4: Retrieve the classes registered by the student
      final QuerySnapshot classRegistrationQuerySnapshot = await FirebaseFirestore.instance.collection('classRegistration')
          .where('student_id', isEqualTo: FirebaseFirestore.instance.doc('users/$studentId'))
          .get();

      // Step 5: Extract the class details for the registered classes
      final List<Map<String, dynamic>> registeredClasses = [];

      for (final doc in classRegistrationQuerySnapshot.docs) {
        final String classId = (doc.data() as Map<String, dynamic>)['class_id'].id;
        final DocumentSnapshot classDocument = await FirebaseFirestore.instance.doc('classes/$classId').get();
        if (classDocument.exists) {
          registeredClasses.add(classDocument.data() as Map<String, dynamic>);
        }
      }

      constantsVaribles.studentClasses=registeredClasses;
    } catch (e) {
      print('Error fetching classes for student: $e');
      return [];
    }
  }


}