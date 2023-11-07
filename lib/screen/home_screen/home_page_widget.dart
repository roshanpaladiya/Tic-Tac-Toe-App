import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/common_widget/home_page_common/button_common_home_page.dart';
import 'package:getx_tic_tik/common_widget/home_page_common/text_common_home_page.dart';
import 'package:getx_tic_tik/common_widget/size_common.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';

Widget homePageBodyPart() {
  return Container(
    height: Get.height,
    width: Get.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(AssetImageRes.bgImage), fit: BoxFit.fill),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.050, vertical: Get.height * 0.028),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///----------------------------setting------------------------///
          homePageSetting,

          ///-----------------------TicTacToe Text---------------------///
          ticTacToe(),
          vertical(Get.height * 0.020),

          ///-----------------------play with Friend Box----------------///
          playWithBox(),
          vertical(Get.height * 0.030),

          ///------------------------Game Start Button-------------------///
          gameStartButton,
          vertical(Get.height * 0.075),

          ///------------------------Share&moreApp Button------------------///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              homePageShare,
              homePageMore,
            ],
          )
        ],
      ),
    ),
  );
}
