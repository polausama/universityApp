import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:university_app/Constants.dart';
import 'package:university_app/Doctor/DoctorHome.dart';
import 'package:university_app/SignUpPage.dart';
import 'package:university_app/second_page.dart';
import 'Manager/ManagerHome.dart';
import 'Student/StudentHome.dart';
import 'Utilies.dart';
import 'controllers/AuthController.dart';




class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
   AuthController controller=Get.put(AuthController());
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
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
              // Logo
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                child:Image.asset("assets/images/logo.png",width: 60.w,height: 20.h,)
              ),
              SizedBox(
                height: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(height: 25,color: Colors.black,)),
                    Image.asset("assets/images/login.png",width: 25.w,height: 8.h,),
                    Expanded(child: Divider(height: 25,color: Colors.black,))
                  ],
                ),
              ),
              SizedBox(height: 6.h,),
              Text("Login",style: TextStyle(
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
                    borderRadius: BorderRadius.all(Radius.circular(10.0)), // Adjust the radius as needed
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
                    borderRadius: BorderRadius.all(Radius.circular(10.0)), // Adjust the radius as needed
                  ),
                ),
              ),
              SizedBox(height: 4.h),

              // Login Button
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
                  child: Text("Log In",style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),

                  ),
                ),
                onTap: ()async {
                  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
                  bool isEmail= emailRegExp.hasMatch(email.text.toString());

                  if(!email.text.toString().isEmpty&& isEmail && pass.text.length>=6)
                    {
                      await controller.login(email.text.toString(), pass.text.toString(),context);
                      constantsVaribles.email=email.text.toString();
                      switch(StaticData.userType)
                      {
                        case "Student":
                          Get.offAll(()=>StudentHome());
                          break;
                        case "Doctor":
                          Get.offAll(()=>DoctorHome());
                          break;
                        case "Manager":
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
