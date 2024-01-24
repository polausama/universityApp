import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:university_app/Student/models/excuse_model.dart';
import 'package:university_app/Student/models/registered_classes_model.dart';
import 'package:university_app/Student/registered_classes.dart';

class WriteExcusePage extends StatelessWidget {
  WriteExcusePage({Key? key}) : super(key: key);
  RegisteredClass  excuseItem=Get.arguments;
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
                              " Write Excuse For ${excuseItem.className} Class",
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 52.h,
                        width: 95.w,
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
                            SizedBox(height: 1.h),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Date',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey, // Border color
                                    width: 2.0,          // Border width
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Text("Time: \t\t${excuseItem.time}"),
                            SizedBox(height: 3.h,),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                height: 20.h,
                                width: 95.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2.5,
                                    color: Colors.grey.withOpacity(0.3),),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset( "assets/images/upload.png",width: 30.w,height: 7.h,),
                                    SizedBox(height: 1.h,),
                                    Text("JPEG,PNG or PDF",style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue
                                    ),)
                                  ],
                                ),
                              ),
                            )
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
