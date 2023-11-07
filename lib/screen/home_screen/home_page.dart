import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/screen/home_screen/home_page_controller.dart';
import 'package:getx_tic_tik/screen/home_screen/home_page_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return SafeArea(
      child: Scaffold(
        body: homePageBodyPart(),
      ),
    );
  }
}
