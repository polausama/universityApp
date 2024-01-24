import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:university_app/SignUpPage.dart';
import 'package:university_app/Utilies.dart';
import 'package:university_app/second_page.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

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
              SizedBox(height: 10.h,),
              Image.asset("assets/images/logo.png",width: 60.w,height: 20.h,),
              SizedBox(height: 10.h,),
                  RoleOption(
                    roleText: "Student",
                    onPressed: () {
                      _navigateToSecondPage('Student');
                    },
                  ),
                  RoleOption(
                    roleText: "Faculty Member",
                    onPressed: () {
                      _navigateToSecondPage('Faculty Member');
                    },
                  ),
              RoleOption(
                roleText: "Department manager",
                onPressed: () {
                  _navigateToSecondPage('Department Manager');
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _navigateToSecondPage(String role) {
    StaticData.userType=role;
    Get.to(()=>SecondPage());
  }
}

class RoleOption extends StatelessWidget {
  final String roleText;
  final VoidCallback onPressed;

  RoleOption({required this.roleText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 60.w,
        height: 10.h,
        margin: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffB89E41),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.5.h),
        child: Text(roleText,style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),

        ),
      ),
    );
  }
}
