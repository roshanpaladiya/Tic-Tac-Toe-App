import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';
import 'package:getx_tic_tik/utils/color_res.dart';
import 'package:getx_tic_tik/utils/string_res.dart';

Widget commonText(String view,
    String image, {
      required VoidCallback onInkWell,
      String text = "",
      double? left,
      double? right,
      IconData? icon,
      void Function()? onPressedButton
    }) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.15),
    child: Row(
      children: [
        SizedBox(height: Get.height * 0.028, child: Image.asset(image)),
        const Spacer(),
        InkWell(
          onTap: onInkWell,
          child: Container(
            height: Get.width * 0.12,
            width: Get.width * 0.25,
            decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(view))),
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(
                        bottom: Get.height * 0.010,
                        left: left ?? 0,
                        right: right ?? 0),
                    child: icon == null ? Text(text,
                      style: TextStyle(
                          shadows: const [Shadow(offset: Offset(0, 2))],
                          fontFamily: StringRes.sigmar,
                          color: ColorsRes.white,
                          fontSize: Get.height * 0.020,
                          overflow: TextOverflow.ellipsis),
                    ) : IconButton(onPressed:onPressedButton, icon: Icon(icon,color: ColorsRes.white)))),
          ),
        ),
      ],
    ),
  );
}

///--------------------------Only info Text---------------------------///
Widget infoText() {
  return Center(
      child: SizedBox(
          height: Get.height * 0.050,
          child: Image.asset(AssetImageRes.infoText)));
}
