import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:university_app/Manager/add_class.dart';
import 'package:university_app/SignUpPage.dart';
import '../controllers/AuthController.dart';


class EditClass extends StatefulWidget {
  EditClass({Key? key}) : super(key: key);

  @override
  State<EditClass> createState() => _EditClassState();
}

class _EditClassState extends State<EditClass> {
  AuthController controller = Get.put(AuthController());
  List<String> classes = [
    'class 1',
    'class 2',
    'class 3',
    'class 4',
  ];
  String selectedClass = 'Select Class';
  Future<void> _showClassSelectionDialog(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Class Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: classes.map((Class) {
              return ListTile(
                title: Text(Class),
                onTap: () {
                  Navigator.of(context).pop(Class);
                },
              );
            }).toList(),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedClass = selected;
      });
    }
  }
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
                top: 50.h,
                left: 2.5.w,
                bottom: 2.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
                  alignment: Alignment.center,
                  width: 96.w,
                  height: 50.h,
                  color: Colors.grey.withOpacity(0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _showClassSelectionDialog(context);
                        },
                        child:Container(
                            color: Colors.white, // Set the background color of the Container to white
                            child: InputDecorator(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                              ),
                              child: Text(selectedClass,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),),
                            )),
                      ),
                      SizedBox(height: 10.h,),
                      Container(width: 40.w,height: 8.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.blueAccent
                        ),
                        child: Text("Edit Class",style:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
