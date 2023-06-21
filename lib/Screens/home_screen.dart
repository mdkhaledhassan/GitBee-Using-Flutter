import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitbee/controllers/show_account_info_controller.dart';
import 'package:gitbee/controllers/show_repositories_controller.dart';
import 'package:gitbee/models/show_repositories.dart';
import 'package:gitbee/widgets/item_grid_view.dart';
import 'package:gitbee/widgets/item_list_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.username});
  final username;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ShowAccountInfoController connect = Get.put(ShowAccountInfoController());
  ShowRepositoriesController connect1 = Get.put(ShowRepositoriesController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect.ShowAccountInfoServiceProvider(
        username: widget.username.toString());
    connect1.ShowRepositoriesServiceProvider(
        username: widget.username.toString());
  }

  TextEditingController dateinput = TextEditingController();

  bool search = false;

  bool view = false;
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
                child: AutoSizeText('Profile',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.ubuntu(
                        //color: Color(0xff494949),
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp)),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: 10.h, bottom: 10.h, left: 20.w, right: 20.w),
            child: Obx(
              () => connect.showAccountInfoMap.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Container(
                                  height: 100.sp,
                                  width: 100.sp,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100.sp),
                                      border: Border.all(
                                          color: Get.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          width: 2.sp)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.sp),
                                    child: Image.network(
                                      connect.showAccountInfo!.avatarUrl
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                FittedBox(
                                  child: AutoSizeText(
                                      connect.showAccountInfo!.name.toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                          //color: Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.sp)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      //color: Colors.black,
                                      size: 20.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    FittedBox(
                                      child: AutoSizeText(
                                          connect.showAccountInfo!.location
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.ubuntu(
                                              //color: Color(0xff494949),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: connect.showAccountInfo!.bio
                                                .toString() ==
                                            'null'
                                        ? " "
                                        : connect.showAccountInfo!.bio
                                            .toString(),
                                    style: GoogleFonts.ubuntu(
                                        //color: Color(0xff494949),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                ),
                                SizedBox(
                                  height:
                                      connect.showAccountInfo!.bio.toString() ==
                                              'null'
                                          ? 0.h
                                          : 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          child: AutoSizeText(
                                              connect
                                                  .showAccountInfo!.publicRepos
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.ubuntu(
                                                  //color: Color(0xff494949),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.sp)),
                                        ),
                                        FittedBox(
                                          child: AutoSizeText('Repositories',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.ubuntu(
                                                  //color: Color(0xff494949),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          child: AutoSizeText(
                                              connect.showAccountInfo!.followers
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.ubuntu(
                                                  //color: Color(0xff494949),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.sp)),
                                        ),
                                        FittedBox(
                                          child: AutoSizeText('Followers',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.ubuntu(
                                                  //color: Color(0xff494949),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          child: AutoSizeText(
                                              connect.showAccountInfo!.following
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.ubuntu(
                                                  //color: Color(0xff494949),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.sp)),
                                        ),
                                        FittedBox(
                                          child: AutoSizeText('Following',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.ubuntu(
                                                  //color: Color(0xff494949),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp)),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1.sp,
                          width: double.infinity,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FittedBox(
                                        child: AutoSizeText('All Repositories',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.ubuntu(
                                                //color: Color(0xff494949),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18.sp)),
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                view = !view;
                                              });
                                            },
                                            child: Icon(
                                              view == true
                                                  ? Icons.list_alt_sharp
                                                  : Icons.grid_view_sharp,
                                              size: 25.sp,
                                              //color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          PopupMenuButton(
                                            position: PopupMenuPosition.under,
                                            child: Icon(
                                              Icons.filter_alt_sharp,
                                              size: 25.sp,
                                              //color: Colors.black,
                                            ),
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
                                                child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);

                                                      setState(() {
                                                        search = false;
                                                        connect1.data.sort(
                                                            (a, b) => a
                                                                .createdAt
                                                                .toString()
                                                                .compareTo(b
                                                                    .createdAt
                                                                    .toString()));
                                                      });
                                                    },
                                                    child: Text('By Date')),
                                              ),
                                              PopupMenuItem(
                                                child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        search = !search;
                                                        connect1.data.sort(
                                                            (a, b) => a.name
                                                                .toString()
                                                                .compareTo(b
                                                                    .name
                                                                    .toString()));
                                                      });
                                                    },
                                                    child: Text('By Name')),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                //
                                Expanded(
                                  flex: 10,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        view == false
                                            ? connect1.dataMap.isNotEmpty
                                                ? ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        connect1.data.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10.h),
                                                        child: ItemList(
                                                            data: connect1
                                                                .data[index]),
                                                      );
                                                    },
                                                  )
                                                : Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.black,
                                                    ),
                                                  )
                                            : connect1.dataMap.isNotEmpty
                                                ? GridView.builder(
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            mainAxisSpacing: 10,
                                                            crossAxisSpacing:
                                                                10),
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        connect1.data.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return ItemGrid(
                                                          data: connect1
                                                              .data[index]);
                                                    })
                                                : Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
        ));
  }
}
