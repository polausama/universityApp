import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:university_app/Constants.dart';
import 'package:university_app/Student/StudentHome.dart';
import 'package:university_app/controllers/AuthController.dart';
import 'package:university_app/second_page.dart';
import 'Doctor/DoctorHome.dart';
import 'Manager/ManagerHome.dart';
import 'Model/User.dart';
import 'Utilies.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);

   TextEditingController email=TextEditingController();
   TextEditingController name=TextEditingController();
   TextEditingController pass=TextEditingController();
   TextEditingController repass=TextEditingController();

   AuthController controller=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              SizedBox(height:2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
                    Get.off(()=>SecondPage());
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
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                child: Image.asset("assets/images/logo.png",width: 60.w,height: 20.h,)
              ),
              SizedBox(
                height: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(height: 25,color: Colors.black,)),
                    Image.asset("assets/images/create_account.png",width: 17.w,height: 8.h,),
                    Expanded(child: Divider(height: 25,color: Colors.black,))
                  ],
                ),
              ),
              SizedBox(height: 6.h,),
              Text("Create Account",style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),),
              SizedBox(height: 2.h,),
              // Email Text Field
              TextFormField(
                
                controller: email,
                
      
                decoration: InputDecoration(
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)), // Adjust the radius as needed
                  ),
                ),
                
                
              ),
              
              
              SizedBox(height: 2.h),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  suffixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)), // Adjust the radius as needed
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              // Password Text Field
              TextFormField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)), // Adjust the radius as needed
                  ),
                ),
              ),
              SizedBox(height: 5.h),

              // Retype Password Text Field
              TextFormField(
                controller: repass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Retype Password',
                  suffixIcon: Icon(Icons.sync_lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)), // Adjust the radius as needed
                  ),
                ),
              ),
              SizedBox(height: 4.h),

              // Create Account Button
          InkWell(
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
              child: Text("Create Account",style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),

              ),
            ),
            onTap: ()async {
                  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
                  bool isEmail= emailRegExp.hasMatch(email.text.toString());
                  print("is Email   $isEmail   \n  ${email.text.toString()}  \n ${pass.text.toString}   \n ${repass.text.toString}");
                  if(!name.text.toString().isEmpty&&!email.text.toString().isEmpty&& isEmail && pass.text.length>=6
                      && pass.text.toString()==repass.text.toString())
                  {
                    await controller.signUp(email.text.toString(),name.text.toString(), pass.text.toString(),context);
                    UserInformation user=UserInformation(email: email.text.toString(),
                        password: pass.text.toString(), type: StaticData.userType);
                    await controller.saveUserInformation(user,context);
                    constantsVaribles.email=email.text.toString();
                    switch(StaticData.userType)
                    {
                      case "Student":
                        Get.offAll(()=>StudentHome());
                        break;
                      case "Faculty Member":
                        Get.offAll(()=>DoctorHome());
                        break;
                      case "Department manager":
                        Get.offAll(()=>ManagerHome());
                    }
                  }
                  else{

                    Get.snackbar("Error", "Check email and password");
                  }
                  },

              ),
            ],
          ),
        ),
      ),
    ));
  }
}
