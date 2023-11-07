import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/screen/playing_screen/play_controller.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';

Widget playGame() {
  return Stack(
    children: [
      Container(
        alignment: Alignment.center,
        height: Get.height * 0.35,
        width: Get.width * 0.80,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AssetImageRes.table),
        )),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: Get.width / 3,
            mainAxisExtent: Get.height * 0.1155,
          ),
          itemBuilder: (context, index) {
            return GetBuilder<PlayScreenController>(
              id: 'tap',
              builder: (controller) {
                return InkWell(
                  onTap: () => controller.onTapPlay(index),
                  child: Center(
                    child: controller.data[index] != ''
                        ? SizedBox(
                            height: Get.height * 0.070,
                            child: Image.asset(
                              controller.data[index],
                            ),
                          )
                        : null,
                  ),
                );
              },
            );
          },
        ),
      ),
      GetBuilder<PlayScreenController>(
        id: "line",
        builder: (controller) {
          return Positioned(
            child: controller.winner != ''
                ? Container(
                    alignment: Alignment.center,
                    height: Get.height * 0.35,
                    width: Get.width * 0.80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(controller.winner),
                            fit: BoxFit.fill)),
                  )
                : const SizedBox(),
          );
        },
      )
    ],
  );
}
