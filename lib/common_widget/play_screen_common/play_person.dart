import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/common_widget/size_common.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';
import 'package:getx_tic_tik/utils/string_res.dart';

///---------------------------Play Person------------------------------///
Widget playPerson() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      person(),
      horizontal(Get.width * 0.010),
      Text(
        StringRes.vs,
        style: TextStyle(
            color: Colors.white,
            fontSize: Get.height * 0.018,
            fontFamily: StringRes.sigmar,
            shadows: const [
              Shadow(
                offset: Offset(0, 1.5),
              )
            ]),
      ),
      horizontal(Get.width * 0.010),
      person(),
    ],
  );
}

Widget person() {
  return SizedBox(
    height: Get.height * 0.050,
    child: Image.asset(AssetImageRes.playPerson),
  );
}
