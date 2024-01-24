import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:university_app/Manager/view_specific_class.dart';
import 'package:university_app/Student/specific_class.dart';

import '../Student/models/registered_classes_model.dart';


class ManagerViewClasses extends StatelessWidget {
  const ManagerViewClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
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
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active_outlined,
                                size: 8.w,
                                color: Colors.grey,
                              )),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.logout,
                                size: 8.w,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        width: 60.w,
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Divider(
                                height: 3.h,
                                color: Colors.grey,
                                thickness: 1,
                              )),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "Registered Clasess",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                              child: Divider(
                                  height: 3.h, color: Colors.grey, thickness: 1)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 95.w,
                  height: 50.h,
                  color: Colors.grey,
                  child: ListView.builder(
                      itemCount: classes.length,
                      itemBuilder: (context, index) {
                        final registeredClass = classes[index];
                        return GestureDetector(
                          onTap: (){
                            Get.to(()=>ViewSpecifiecClass(),arguments: registeredClass);
                          },
                          child: Container(
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 2.5,
                                color: Colors.grey.withOpacity(0.3),),
                            ),
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text("Class Name: ${registeredClass.className}"),
                                    Spacer(),
                                    Text("Class Num: ${registeredClass.classNum}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Doctor Name: ${registeredClass.doctorName}"),
                                    Spacer(),
                                    Text("Student Num: ${registeredClass.studentNum}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Day: ${registeredClass.day}"),
                                    Spacer(),
                                    Text("Time: ${registeredClass.time}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ])));
  }
}
