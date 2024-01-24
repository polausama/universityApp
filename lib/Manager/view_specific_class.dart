import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:university_app/Student/list_of_excuses.dart';
import 'package:university_app/Student/list_of_students_page.dart';
import 'package:university_app/Student/write_excuse_page.dart';

import '../Student/models/registered_classes_model.dart';


class ViewSpecifiecClass extends StatelessWidget {
  ViewSpecifiecClass({Key? key}) : super(key: key);
  RegisteredClass  Class=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack
              (children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  padding: EdgeInsets.only(top: 5.h),
                  width: 100.w,
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
                            "${Class.className}",
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
              Positioned(
                top: 50.h,
                left: 2.5.w,
                child: Container(
                  width: 95.w,
                  height: 50.h,
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20.h,
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
                                Text("Class Name: ${Class.className}"),
                                Spacer(),
                                Text("Class Num: ${Class.classNum}"),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              children: [
                                Text("Doctor Name: ${Class.doctorName}"),
                                Spacer(),
                                Text("Student Num: ${Class.studentNum}"),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              children: [
                                Text("Day: ${Class.day}"),
                                Spacer(),
                                Text("Time: ${Class.time}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>ListOfStudentsPage(),arguments:Class);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                color: Color(0xff1D88B5),
                              ),
                              width: 40.w,height: 10.h,

                              child: Text(
                                "Accept Excuses",style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>ListOfExcusesPage(),arguments:Class);
                            },
                            child: Container(
                              width: 40.w,height: 10.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                color: Color(0xff1D88B5),
                              ),
                              child: Text(
                                "Reject Excuses",style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>ListOfStudentsPage(),arguments:Class);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                color: Color(0xff1D88B5),
                              ),
                              width: 40.w,height: 10.h,

                              child: Text(
                                "View Apology",style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>ListOfExcusesPage(),arguments:Class);
                            },
                            child: Container(
                              width: 40.w,height: 10.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                color: Color(0xff1D88B5),
                              ),
                              child: Text(
                                "Write Apology",style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
