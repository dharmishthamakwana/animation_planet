import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/Homecontroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  HomeController homeController = Get.put(HomeController());
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 12))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //Galaxy Planets
      child: Scaffold(
        backgroundColor: Color(0XFF3E3963),
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("GALAXY PLLANETS"),
          centerTitle: true,
          actions: [Icon(Icons.search)],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade300,
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              // physics: ScrollPhysics(
              //   parent: BouncingScrollPhysics(),
              // ),
              itemCount: homeController.PlanetList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    homeController.h1.value = homeController.PlanetList[index];
                    Get.toNamed('view');
                  },
                  child: Obx(
                    () => Container(
                        height: 26.h,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.red,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 19.w, top: 2.5.h),
                              child: Container(
                                height: 21.h,
                                width: 75.w,
                                decoration: BoxDecoration(
                                    color: Color(0XFF424171),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 15,
                                          offset: Offset(0, 0))
                                    ]),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 18.h,
                                      width: 65.w,
                                      margin: EdgeInsets.only(left: 6.w),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.w, top: 4.h),
                                                child: Text(
                                                  "${homeController.PlanetList[index].name}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 15.w),
                                                child: Text(
                                                  "Milkyway Glaxey",
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.w, top: 1.h),
                                                child: Container(
                                                  height: 0.3.h,
                                                  width: 12.w,
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.w, top: 2.5.h),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          height: 2.h,
                                                          width: 2.h,
                                                          child: Image.asset(
                                                              "assets/image/ic_distance.png")),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Text(
                                                        "${homeController.PlanetList[index].distance} km",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 9.sp),
                                                      ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Container(
                                                          height: 2.h,
                                                          width: 2.h,
                                                          child: Image.asset(
                                                              "assets/image/ic_gravity.png")),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Text(
                                                        "${homeController.PlanetList[index].gravity} m/s²",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 9.sp),
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 5.6.h, left: 3.w),
                                child: AnimatedBuilder(
                                  animation: animationController!,
                                  child: Container(
                                    height: 15.h,
                                    width: 15.h,
                                    child: Image.asset(
                                        "${homeController.PlanetList[index].image}"),
                                  ),
                                  builder: (context, child) {
                                    return Transform.rotate(
                                      angle:
                                          animationController!.value * 2 * pi,
                                      child: child,
                                    );
                                  },
                                )),
                          ],
                        )),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
