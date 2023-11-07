import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/common_widget/setting_page_common/common_text.dart';
import 'package:getx_tic_tik/common_widget/setting_page_common/setting_button.dart';
import 'package:getx_tic_tik/common_widget/size_common.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';
import 'package:getx_tic_tik/utils/string_res.dart';
import 'package:readmore/readmore.dart';

Widget settingBody() {
  return SingleChildScrollView(
    physics: const NeverScrollableScrollPhysics(),
    child: Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetImageRes.bgImage), fit: BoxFit.fill)),
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.030),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.050, bottom: Get.width * 0.050),
              child: settingPageBack,
            ),
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: Get.height * 0.70,
                    width: Get.width * 0.85,
                    child: Image.asset(AssetImageRes.settingPage),
                  ),
                ),
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.046),
                  child: SizedBox(
                      height: Get.height * 0.050,
                      child: Image.asset(AssetImageRes.settingText)),
                )),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      userName(),
                      review(),
                      music(),
                      soundSetting(),
                      infoText(),
                      moreGame(),
                      helpSupport(),
                      privacyPolicy(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

///----------------------------------Privacy Policy Dialog------------------------///
Future privacyDialog() {
  return Get.dialog(
    Dialog(
      child: Container(
        height: Get.height * 0.40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage(AssetImageRes.bgImage), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              const ReadMoreText(
                StringRes.privacy,
                textAlign: TextAlign.start,
                trimLines: 12,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show more",
                trimExpandedText: "Show less",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: StringRes.sigmar,
                ),
              ),
              vertical(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () => Get.back(),
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetImageRes.textBg),
                              fit: BoxFit.fill)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 14),
                        child: Center(
                          child: Text(
                            StringRes.cancel,
                            style: TextStyle(
                                fontFamily: StringRes.sigmar,
                                color: Colors.black,
                                fontSize: Get.height * 0.020),
                          ),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => Get.back(),
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetImageRes.textBg),
                              fit: BoxFit.fill)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: Text(
                            StringRes.accept,
                            style: TextStyle(
                                fontFamily: StringRes.sigmar,
                                color: Colors.black,
                                fontSize: Get.height * 0.020),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
