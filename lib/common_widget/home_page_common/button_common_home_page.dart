import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/screen/home_screen/home_page_controller.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';

///---------------------Common Button-----------------------///
Widget buttonHomeScreen(
    {required String image,
    required VoidCallback onTap,
    double? left,
    double? height,
    double? width}) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      height: height,
      width: width,
      child: Image.asset(image),
    ),
  );
}

///----------------------Setting Button-------------------------------///
Widget homePageSetting = GetBuilder<HomePageController>(
  id: "homePageSetting",
  builder: (controller) {
    return buttonHomeScreen(
      image: AssetImageRes.settingButtonImage,
      height: Get.height * 0.090,
      onTap: () => controller.onTapSetting(),
    );
  },
);

///--------------------------Start Button--------------------///
Widget gameStartButton = Align(
  alignment: Alignment.center,
  child: GetBuilder<HomePageController>(
    id: "start",
    builder: (controller) {
      return buttonHomeScreen(
          image: AssetImageRes.playGameButtonImage,
          height: Get.height * 0.12,
          onTap: () => controller.onGameStartButton());
    },
  ),
);

///--------------------------Share--------------------------------///
Widget homePageShare = GetBuilder<HomePageController>(
  builder: (controller) {
    return buttonHomeScreen(
        image: AssetImageRes.sharButtonImage,
        height: Get.height * 0.093,
        onTap: () => controller.onShareButton());
  },
);

///-------------------------------------More Game--------------------------------------///
Widget homePageMore = GetBuilder<HomePageController>(
  id: "moreGameHome",
  builder: (controller) {
    return buttonHomeScreen(
        image: AssetImageRes.moreGameButtonImage,
        height: Get.height * 0.093,
        onTap: () => controller.moreGameButton());
  },
);
