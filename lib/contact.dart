import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickk/provider/profile.dart';

class Contact extends StatefulWidget {
  const Contact({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<Contact> {
  List contactus = [];
  bool loading = false;
  @override
  void initState() {
    super.initState();
    contact();
  }

  contact() async {
    setState(() {
      loading = true;
    });
    try {
      var res = await Provider().contact();
      setState(() {
        contactus.addAll(res['data']);
      });
      // toast(res['message'].toString());
      print(res['data']);
    } catch (e) {
      print(e.toString() + 'mmm');
      Fluttertoast.showToast(
          msg: e.toString(), toastLength: Toast.LENGTH_SHORT);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Contact US",
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                          width: 250.w,
                          margin: EdgeInsets.all(20.w),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email ID:  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      contactus[0]['emailid1'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email ID:  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      contactus[0]['emailid2'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'MobileNo1:  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      contactus[0]['mobileno1'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'MobileNo2:  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      contactus[0]['mobileno2'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'OfficeNo1:  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      contactus[0]['officeno1'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'OfficeNo2:  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      contactus[0]['officeno2'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              // heightSpace5,
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     const Text(
                              //       'Address:  ',
                              //       style: BaseStyles.mainbold15,
                              //     ),
                              //     Expanded(
                              //       child: Text(
                              //         "${data.address1.toString()} ${data.address2.toString()} ${data.address3.toString()} ${data.pincode.toString()}",
                              //         style: BaseStyles.blackb15,
                              //       ),
                              //     )
                              // ],
                              // )
                            ],
                          )),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
