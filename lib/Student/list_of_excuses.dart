import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:university_app/Student/models/excuse_model.dart';
import 'package:university_app/Student/registered_classes.dart';
import 'package:university_app/Student/specifiec_excuse_page.dart';

import 'models/registered_classes_model.dart';

class ListOfExcusesPage extends StatelessWidget {
  const ListOfExcusesPage({Key? key}) : super(key: key);
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
                              "List Of Excuses",
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
                bottom: 2.h,
                child: Container(
                  width: 95.w,
                  height: 73.h,
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80.w,
                        height: 69.h,
                        child: ListView.builder(
                            itemCount: excusesList.length,
                            itemBuilder: (context,index){
                              final ExcuseItem = excusesList[index];
                              return GestureDetector(
                                onTap: (){
                                  Get.to(()=>SpecificExcuse(),arguments: ExcuseItem);
                                },
                                child: Container(
                                  height: 22.h,
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
                                      Text("Student Num:\t\t ${ExcuseItem.studentNum}"),
                                      SizedBox(height: 1.h,),
                                      Text("Class Name:\t\t ${ExcuseItem.className}"),
                                      SizedBox(height: 1.h,),
                                      Text("Class Num:\t\t ${ExcuseItem.classNum}"),
                                      SizedBox(height: 1.h,),
                                      Row(
                                        children: [
                                          Text("Day: ${ExcuseItem.day}"),
                                          Spacer(),
                                          Text("date: ${ExcuseItem.date}"),
                                        ],
                                      ),
                                      SizedBox(height: 1.h,),
                                      Row(
                                        children: [
                                          Text("Time: ${ExcuseItem.time}"),
                                          Spacer(),
                                          Text("status: ${ExcuseItem.status}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
