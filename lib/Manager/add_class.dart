import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class AddClassPage extends StatefulWidget {
   AddClassPage({super.key});

  @override
  State<AddClassPage> createState() => _AddClassPageState();
}

class _AddClassPageState extends State<AddClassPage> {
  List<String> doctors = [
    'Doctor 1',
    'Doctor 2',
    'Doctor 3',
    'Doctor 4',
  ];
  List<String> students = [
    'student 1',
    'student 2',
    'student 3',
    'student 4',
  ];
  String selectedDoctor = 'Select Doctor';
  String selectedStudent = 'Select Student';
  Future<void> _showDoctorSelectionDialog(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Doctor Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: doctors.map((doctor) {
              return ListTile(
                title: Text(doctor),
                onTap: () {
                  Navigator.of(context).pop(doctor);
                },
              );
            }).toList(),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedDoctor = selected;
      });
    }
  }
  Future<void> _showStudentSelectionDialog(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Student Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: students.map((student) {
              return ListTile(
                title: Text(student),
                onTap: () {
                  Navigator.of(context).pop(student);
                },
              );
            }).toList(),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedStudent = selected;
      });
    }
  }
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
                  height: 20.h,
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
                            "Add CLASS",
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
                top: 23.h,
                left: 2.5.w,
                bottom: 2.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
                  alignment: Alignment.center,
                  width: 96.w,
                  height: 53.h,
                  color: Colors.grey.withOpacity(0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                      onTap: () {
                _showDoctorSelectionDialog(context);
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
                      child: Text(selectedDoctor,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),),
                  )),
                      ),
                      SizedBox(height: 2.h,),
                      InkWell(
                        onTap: () {
                          _showStudentSelectionDialog(context);
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
                              child: Text(selectedStudent,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),),
                            )),
                      ),
                       SizedBox(height: 2.h,),
                       Container(
                         color: Colors.white,
                         child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name Of Class",
                            hintStyle:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                      ),
                       ),
                      SizedBox(height: 2.h,),
                      Container(
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Number Of Class",
                            hintStyle:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Container(
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Day",
                            hintStyle:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Container(
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Time",
                            hintStyle:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Container(width: 40.w,height: 8.h,
                      alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent
                        ),
                        child: Text("Create Class",style:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                      )
                    ],
                  ),
                ),
              )
            ])));

  }
}
