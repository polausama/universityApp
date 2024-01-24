
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:university_app/Model/User.dart';
class AuthController extends GetxController
{
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(null);
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<dynamic> saveUserInformation(UserInformation user, BuildContext context) async {
    showLoadingDialog(context);
    await usersCollection.doc(user.email).set(user.toMap());
    Navigator.pop(context);

  }
  @override
  void onInit() {
    super.onInit();
    if(user.value !=null)
      user.value = _auth.currentUser;
  }

  Future<dynamic> signUp(String email, String name,String password,BuildContext context) async {
    try {
      showLoadingDialog(context);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<dynamic> login(String email, String password,BuildContext context) async {
    try {
      showLoadingDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading...'),
            ],
          ),
        );
      },
    );
  }
}