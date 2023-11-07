import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/screen/playing_screen/play_controller.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';

///--------------------------------common button----------------------------------///
Widget buttonPlayScreen(
    {required String image,
    required VoidCallback onTap,
    double? left,
    double? height,
    double? width}) {
  return InkWell(
      onTap: onTap,
      child: SizedBox(height: height, width: width, child: Image.asset(image)));
}

///------------------------------------play Screen Back---------------------------------///
Widget playScreenBack = GetBuilder<PlayScreenController>(
  builder: (controller) {
    return buttonPlayScreen(
      image: AssetImageRes.settingBackButtonImage,
      height: Get.height * 0.085,
      onTap: () => controller.onBackButton(),
    );
  },
);

///------------------------setting play screen-------------------------------///
Widget playScreenSetting = GetBuilder<PlayScreenController>(
  builder: (controller) {
    return buttonPlayScreen(
      image: AssetImageRes.settingButtonImage,
      height: Get.height * 0.085,
      onTap: () => controller.onSettingPlayScreen(),
    );
  },
);

///----------------------------menu button----------------------------------------///
Widget restartButton = GetBuilder<PlayScreenController>(
  id: "restart",
  builder: (controller) {
    return InkWell(
        onTap: () => controller.restartScreen(),
        child: imageCommon(AssetImageRes.menuButton));
  },
);

///----------------------------play again----------------------------------------///
Widget againButton = GetBuilder<PlayScreenController>(
  builder: (controller) {
    return InkWell(
        onTap: () => controller.playAgain(),
        child: imageCommon(AssetImageRes.playAgain));
  },
);

Widget imageCommon(String image) {
  return SizedBox(
    height: Get.height * 0.080,
    child: Image.asset(image),
  );
}
