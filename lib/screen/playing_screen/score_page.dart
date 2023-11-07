import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/common_widget/size_common.dart';
import 'package:getx_tic_tik/screen/playing_screen/play_controller.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';
import 'package:getx_tic_tik/utils/color_res.dart';
import 'package:getx_tic_tik/utils/string_res.dart';

Widget score() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  height: Get.height * 0.035,
                  child: Image.asset(AssetImageRes.diamond)),
              SizedBox(width: Get.width * 0.010),
              scoreText(StringRes.player1)
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 3),
              scoreText(StringRes.score),
              horizontal(7),
              GetBuilder<PlayScreenController>(
                id: "player",
                builder: (controller) {
                  return Text(
                    controller.player1.toString(),
                    style: TextStyle(
                        fontSize: Get.height * 0.032,
                        color: ColorsRes.red,
                        fontWeight: FontWeight.w700),
                  );
                },
              )
            ],
          )
        ],
      ),
      horizontal(Get.width * 0.020),
      SizedBox(
          height: Get.height * 0.085, child: Image.asset(AssetImageRes.line)),
      horizontal(Get.width * 0.020),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                  height: Get.height * 0.035,
                  child: Image.asset(AssetImageRes.starX)),
              SizedBox(width: Get.width * 0.010),
              scoreText(StringRes.player2)
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 3),
              scoreText(StringRes.score),
              horizontal(Get.width * 0.020),
              GetBuilder<PlayScreenController>(
                id: "player",
                builder: (controller) {
                  return Text(
                    controller.player2.toString(),
                    style: TextStyle(
                        fontSize: Get.height * 0.032,
                        color: ColorsRes.amber,
                        fontWeight: FontWeight.w700),
                  );
                },
              )
            ],
          )
        ],
      )
    ],
  );
}

//--------------------------text common score bord------------------------------
Widget scoreText(String text) {
  return Text(
    text,
    style:
        const TextStyle(color: ColorsRes.white, fontFamily: StringRes.sigmar),
  );
}
