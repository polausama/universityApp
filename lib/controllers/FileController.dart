import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_app/Model/StudentRequest.dart';
import 'package:university_app/controllers/AuthController.dart';

import '../Utilies.dart';

class FileController extends GetxController
{
  FirebaseStorage _storage = FirebaseStorage.instance;
  String _filePath = '';
  String fileName='';
  FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference studentRequestsCollection =
  FirebaseFirestore.instance.collection('request');
  RxList<Request> requests = <Request>[].obs; // Use RxList for reactivity
  RxList<Request> Srequests = <Request>[].obs; // Use RxList for reactivity
  RxList<Request> Prequests = <Request>[].obs; // Use RxList for reactivity


  Future<void> updateRequestStatus(Request request) async {
    try {
      AuthController.showLoadingDialog(Get.context!);
      await studentRequestsCollection.doc(request.documentId).update({
        'status': request.status,
      });
      Get.snackbar("Done",'Request status updated successfully');
      Navigator.of(Get.context!).pop();
    } catch (e) {
      print('Error updating request status: $e');
    }
  }

  Future<void> uploadFile(String path, String userId) async {
    try {
      AuthController.showLoadingDialog(Get.context!);
      Reference ref = _storage.ref().child('uploads/$userId/${DateTime.now().toString()}');
      UploadTask uploadTask = ref.putFile(File(path));
      await uploadTask.whenComplete(() => print('File uploaded'));
      Navigator.pop(Get.context!);
      Get.snackbar("Done", "file uploaded seuccesfully");
    } catch (e) {
      Navigator.pop(Get.context!);
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserRequests();
    getStudentsRequests();
    getDoctorsRequests();
  }

  Future<void> _showUploadDialog(BuildContext context, String fileName,String t) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to upload the file?'),
          content: Text('File Name: $fileName'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                  _filePath = '';

              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () async {
                Navigator.of(context).pop();
                if (_filePath != null && _filePath!.isNotEmpty) {
                  await uploadFile(_filePath! , _auth.currentUser!.uid);
                    _filePath = '';
                  SaveUserRequest(Request(documentId: " ",name:fileName,status: "Pending",userId: _auth.currentUser!.uid,
                           dateTime: DateTime.now().toString(), type: t,),_auth.currentUser!.uid);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> pickFile(BuildContext context,String t) async {
    try {
      print("1");
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, // You can also use FileType.image or FileType.pdf
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'], // Customize the allowed extensions
      );
      print("2");
      if (result != null) {
          _filePath = result.files.single.path!;
           fileName = result.files.single.name;
          _showUploadDialog(context, fileName,t);
          print("3");
      }
      else
        {
          print("4");
        }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> SaveUserRequest(Request request,String userID) async {
    AuthController.showLoadingDialog(Get.context!);
    var response=await studentRequestsCollection.add(request.toMap());
    Navigator.of(Get.context!).pop();
    return response.id;
  }

  Future<void> getUserRequests() async {
    List<Request> Requests = [];

    try {
      QuerySnapshot querySnapshot =
      await studentRequestsCollection.get();

      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if(data['userId']==_auth.currentUser!.uid) {
          Requests.add(Request(
            userId: data['userId'],
            dateTime: data['dateTime'],
            type: data['type'],
            name: data['name'],
            status: data['status'],
            documentId: docSnapshot.id
          ));
        }
      }
    } catch (e) {
      Get.snackbar("Error!!!",'Error getting requests: $e');
    }

    print("length............ ${requests.length}");
    requests.value= Requests;

  }

  Future<void> getStudentsRequests() async {
    List<Request> Requests = [];

    try {
      QuerySnapshot querySnapshot =
      await studentRequestsCollection.get();

      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if(data['type']=="Student" && data['status']=="Pending") {
          Requests.add(Request(
            documentId: docSnapshot.id,
            userId: data['userId'],
            dateTime: data['dateTime'],
            type: data['type'],
            name: data['name'],
            status: data['status'],
          ));
        }
      }
    } catch (e) {
      Get.snackbar("Error!!!",'Error getting requests: $e');
    }

    print("length............ ${requests.length}");
    Srequests.value= Requests;

  }

  Future<void> getDoctorsRequests() async {
    List<Request> Requests = [];

    try {
      QuerySnapshot querySnapshot =
      await studentRequestsCollection.get();

      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if(data['type']=="Doctor"  && data['status']=="Pending") {
          Requests.add(Request(
            documentId: docSnapshot.id,
            userId: data['userId'],
            dateTime: data['dateTime'],
            type: data['type'],
            name: data['name'],
            status: data['status'],
          ));
        }
      }
    } catch (e) {
      Get.snackbar("Error!!!",'Error getting requests: $e');
    }

    print("length............ ${requests.length}");
    Prequests.value= Requests;

  }


}

