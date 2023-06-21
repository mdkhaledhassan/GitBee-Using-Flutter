import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitbee/Screens/details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key, required this.data});
  final data;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailsScreen(data: widget.data),
                type: PageTransitionType.fade));
      },
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                width: 1.sp)),
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30.sp,
                      width: 30.sp,
                      decoration: BoxDecoration(
                        //color: Colors.black,
                        borderRadius: BorderRadius.circular(100.sp),
                        border: Border.all(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            width: 1.sp),
                      ),
                      child: Center(
                        child: FittedBox(
                          child: AutoSizeText(widget.data.name[0].toUpperCase(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                  //color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                flex: 12,
                child: RichText(
                  text: TextSpan(
                    text: widget.data.name,
                    style: GoogleFonts.ubuntu(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_right_rounded,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      size: 30.sp,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
