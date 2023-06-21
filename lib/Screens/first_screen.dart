import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gitbee/Screens/home_screen.dart';
import 'package:gitbee/api_services.dart';
import 'package:gitbee/constants.dart';
import 'package:gitbee/controllers/show_account_info_controller.dart';
import 'package:gitbee/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Future<bool> onBackPressed() {
    return Get.dialog(
        barrierDismissible: false,
        AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            content: Container(
              height: 100.h,
              width: 150.w,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                        child: AutoSizeText(
                      'Do you want to exit the App?',
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp),
                    )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Container(
                            height: 30.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                'No',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            SystemNavigator.pop();
                          },
                          child: Container(
                            height: 30.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                'Yes',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))).then((value) => value ?? false);
  }

  bool isLight = false;

  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              systemNavigationBarColor: Colors.white,
              statusBarColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            //backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.2,
              //backgroundColor: Colors.white,
              leading: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                child: Icon(
                  Icons.menu,
                  //color: Colors.black,
                  size: 25.sp,
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 0.w, top: 10.h, bottom: 10.h),
                child: FittedBox(
                  child: AutoSizeText('GitBee',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.ubuntu(
                          //color: Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp)),
                ),
              ),
              actions: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 20.w, top: 10.h, bottom: 10.h),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLight = !isLight;
                        Get.changeTheme(Get.isDarkMode
                            ? ThemeClass().lightThemeData(context)
                            : ThemeData.dark());
                      });
                    },
                    child: Icon(
                      isLight == true ? Icons.nights_stay : Icons.wb_sunny,
                      size: 25.sp,
                      //color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  top: 100.h, left: 20.w, right: 20.w, bottom: 20),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/github.svg',
                    height: 120.h,
                    width: 120.w,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  FittedBox(
                    child: AutoSizeText('Search Your Github Account',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.ubuntu(
                            //color: Color(0xff494949),
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp)),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    controller: username,
                    validator: (value) {
                      if (username.text.isEmpty)
                        return 'Please Input Github Username.';
                    },
                    style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 0.h, bottom: 0.h, left: 20.w, right: 20.w),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xffD9D9D9), width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xffD9D9D9), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xffD9D9D9), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xffD9D9D9), width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xffD9D9D9), width: 1),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Write your github username here...',
                      hintStyle: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () async {
                      if (username.text.isNotEmpty) {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: HomeScreen(username: username.text),
                                type: PageTransitionType.fade));
                      } else {
                        showToast('Please Enter Your Github Username');
                      }
                    },
                    child: Container(
                      height: 45.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: AutoSizeText(
                          'Search',
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
