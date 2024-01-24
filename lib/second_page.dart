import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:university_app/Login.dart';
import 'package:university_app/SignUpPage.dart';
import 'package:university_app/Utilies.dart';

import 'FirstPage.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height:2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){
                        Get.off(()=>FirstScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 2.w),
                        width: 9.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey
                        ),
                        child: Icon(Icons.chevron_left,color: Colors.white,size:6.w,),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Image.asset("assets/images/logo.png",width: 60.w,height: 20.h,),
                  SizedBox(height: 10.h,),
                  Text("${StaticData.userType}",style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 2.h,),
                  RoleOption(
                    roleText: "Create an account",
                    onPressed: () {
                      _navigateToSignupPage();
                    },
                  ),
                  RoleOption(
                    roleText: "Log In",
                    onPressed: () {
                      _navigateToLoginPage();
                    },
                  ),

                ],
              ),
            ),
          ),
        ));
  }
  void _navigateToSignupPage() {
    Get.to(()=>SignUpPage());
  }
  void _navigateToLoginPage() {
    Get.to(()=>LoginPage());
  }
}