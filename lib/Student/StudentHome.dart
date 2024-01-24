import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:university_app/Student/registered_classes.dart';
import 'package:university_app/controllers/AuthController.dart';
import 'package:university_app/controllers/FileController.dart';
import '../SignUpPage.dart';
import '../Model/StudentRequest.dart';

class StudentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                padding: EdgeInsets.only(top: 5.h),
                width: double.infinity,
                height: 50.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.notifications_active_outlined,size: 8.w,color: Colors.grey,)),
                        Spacer(),
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.logout,size: 8.w,color: Colors.grey,)),
                      ],
                    ),
                    Image.asset("assets/images/logo.png",width: 60.w,height: 20.h,)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>RegisteredClasses());
              },
              child: Container(
                color: Color(0xffB89E41),
                width: 100.w,
                height: 50.h,
                child: Image.asset("assets/images/register.PNG")
              ),
            )

          ],
        )
      ),
    );
  }
}
