import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitbee/models/show_repositories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.data});
  final RepositoryModel data;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
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
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  //color: Colors.black,
                  size: 25.sp,
                ),
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 0.w, top: 10.h, bottom: 10.h),
              child: FittedBox(
                child: AutoSizeText(
                  'Repository Details',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.ubuntu(
                      //color: Color(0xff494949),
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    //color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: widget.data.name,
                              style: GoogleFonts.ubuntu(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp),
                            ),
                            maxLines: null,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: FittedBox(
                            child: AutoSizeText(
                              'Created : ${Jiffy(widget.data.createdAt).format("dd MMMM yyyy")}',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.ubuntu(
                                  //color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: AutoSizeText(
                                      widget.data.stargazersCount.toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                          //color: Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.sp)),
                                ),
                                FittedBox(
                                  child: AutoSizeText('Stars',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                          //color: Color(0xff494949),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp)),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: AutoSizeText(
                                      widget.data.watchersCount.toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                          //color: Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.sp)),
                                ),
                                FittedBox(
                                  child: AutoSizeText('Watching',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                          //color: Color(0xff494949),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp)),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: AutoSizeText(
                                      widget.data.forksCount.toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                          //color: Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.sp)),
                                ),
                                FittedBox(
                                  child: AutoSizeText('Forks',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                          //color: Color(0xff494949),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 1.sp,
                  width: double.infinity,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    //color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: 'Language : ',
                                style: GoogleFonts.ubuntu(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                                children: [
                                  TextSpan(
                                    text: widget.data.language,
                                    style: GoogleFonts.ubuntu(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp),
                                  ),
                                ]),
                            maxLines: null,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: 'Description : ',
                                style: GoogleFonts.ubuntu(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                                children: [
                                  TextSpan(
                                    text: widget.data.description,
                                    style: GoogleFonts.ubuntu(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp),
                                  ),
                                ]),
                            maxLines: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
