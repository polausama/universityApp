import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:university_app/Student/registered_classes.dart';


class DoctorListOfStudentsPage extends StatelessWidget {
  const DoctorListOfStudentsPage({Key? key}) : super(key: key);
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
                  height: 45.h,
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
                            "List Of Students",
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
                bottom: 2.h,
                child: Container(
                  width: 95.w,
                  height: 53.h,
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80.w,
                        height: 35.h,
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context,index){
                              return Container(
                                alignment: Alignment.center,
                                height: 7.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2.5,
                                    color: Colors.grey.withOpacity(0.3),),
                                ),
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                                child: Text("Student # ${index+1}",style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Colors.grey
                                ),),
                              );
                            }),
                      ),
                      SizedBox(height: 2.h,),
                      GestureDetector(
                        onTap: (){
                          Get.off(()=>RegisteredClasses());
                        },
                        child: Container(width: 60.w,height: 7.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(15),
                            color: Color(0xff1D88B5),
                          ),
                          child: Text(
                            "EXIT",style: TextStyle(
                              fontSize: 14.sp,
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
