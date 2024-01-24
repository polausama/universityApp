import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:university_app/Manager/add_class.dart';
import 'package:university_app/SignUpPage.dart';
import '../controllers/AuthController.dart';


class RegisteredClasses extends StatelessWidget {
  RegisteredClasses({Key? key}) : super(key: key);
  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
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
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  top: 50.h,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    height: 50.h,
                    color: Color(0xffB5995B),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width:5.w),
                            GestureDetector(
                              onTap: (){
                                Get.to(()=>AddClassPage());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 40.w,
                                height: 15.h,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.remove_circle,size: 5.h,color: Colors.blue,),
                                    Text("Remove Class",style: TextStyle(fontSize: 12.sp,color: Colors.blue,fontWeight: FontWeight.w700),)
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                alignment: Alignment.center,
                                width: 40.w,
                                height: 15.h,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.edit_note,size: 5.h,color: Colors.blue,),
                                    Text("Edit Class",style: TextStyle(fontSize: 10.sp,color: Colors.blue,fontWeight: FontWeight.w700),)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width:5.w),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            alignment: Alignment.center,
                            width: 40.w,
                            height: 15.h,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.content_paste_search,size: 5.h,color: Colors.blue,),
                                Text("View Class",style: TextStyle(fontSize: 10.sp,color: Colors.blue,fontWeight: FontWeight.w700),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h,),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
