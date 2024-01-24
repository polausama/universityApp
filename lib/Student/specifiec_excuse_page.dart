import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:university_app/Student/models/excuse_model.dart';
import 'package:university_app/Student/registered_classes.dart';

class SpecificExcuse extends StatelessWidget {
  SpecificExcuse({Key? key}) : super(key: key);
  Excuse  excuseItem=Get.arguments;
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
                  height: 25.h,
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
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        height: 8.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              " Excuse About ${excuseItem.className} Class",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Divider(
                              height: 3.h,
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 25.h,
                left: 2.5.w,
                child: Container(
                  width: 95.w,
                  height: 70.h,
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 2.5,
                            color: Colors.grey.withOpacity(0.3),),
                        ),
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Student Num:\t\t ${excuseItem.studentNum}"),
                            SizedBox(height: 1.h,),
                            Text("Class Name:\t\t ${excuseItem.className}"),
                            SizedBox(height: 1.h,),
                            Text("Class Num:\t\t ${excuseItem.classNum}"),
                            SizedBox(height: 1.h,),
                            Text("Day: \t\t${excuseItem.day}"),
                            SizedBox(height: 1.h,),
                            Text("date: \t\t${excuseItem.date}"),
                            SizedBox(height: 1.h,),
                            Text("Time: \t\t${excuseItem.time}"),
                            SizedBox(height: 1.h,),
                            Text("status: \t\t${excuseItem.status}"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      GestureDetector(
                        onTap: (){
                          Get.off(()=>RegisteredClasses());
                        },
                        child: Container(width: 60.w,height: 10.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(15),
                            color: Color(0xff1D88B5),
                          ),
                          child: Text(
                            "EXIT",style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ])));
  }
}
