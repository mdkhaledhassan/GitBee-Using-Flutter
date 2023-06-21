import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitbee/Screens/details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ItemGrid extends StatefulWidget {
  const ItemGrid({super.key, required this.data});
  final data;

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
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
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                width: 1.sp)),
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 60.sp,
                width: 60.sp,
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
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp)),
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: widget.data.name,
                  style: GoogleFonts.ubuntu(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp),
                ),
                maxLines: 3,
                overflow: TextOverflow.fade,
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
