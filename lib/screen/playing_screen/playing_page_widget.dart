import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/common_widget/play_screen_common/button_common_play_screen.dart';
import 'package:getx_tic_tik/common_widget/play_screen_common/play_person.dart';
import 'package:getx_tic_tik/screen/playing_screen/game_logic.dart';
import 'package:getx_tic_tik/screen/playing_screen/score_page.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';

Widget playPageBody() {
  return Container(
    height: Get.height,
    width: Get.width,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetImageRes.bgImage), fit: BoxFit.cover)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.040),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              playScreenBack,
              playScreenSetting,
            ],
          ),
          playPerson(),
          playGame(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              restartButton,
              againButton,
            ],
          ),
          score()
        ],
      ),
    ),
  );
}
