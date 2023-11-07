import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/common_widget/setting_page_common/common_text.dart';
import 'package:getx_tic_tik/screen/setting_screen/setting_controller.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';
import 'package:getx_tic_tik/utils/string_res.dart';

///------------------------Setting Back Button-------------------------///
Widget settingPageBack = GetBuilder<SettingPageController>(
  id: "settingPageBack",
  builder: (controller) {
    return InkWell(
        onTap: () => controller.settingBack(),
        child: SizedBox(
            height: Get.height * 0.080,
            child: Image.asset(AssetImageRes.settingBackButtonImage)));
  },
);

///----------------------User Name------------------------------------///
Widget userName() {
  return GetBuilder<SettingPageController>(
    id: "userDio",
    builder: (controller) {
      return commonText(AssetImageRes.textBg, AssetImageRes.useNameText,
          onInkWell: () => controller.userNameDialog(),
          left: Get.height * 0.010,
          text: controller.getUserName ?? '');
    },
  );
}

///--------------------------------------them------------------------------------///
Widget them() {
  return GetBuilder<SettingPageController>(
    id: "them",
    builder: (controller) {
      return commonText(
        AssetImageRes.textBg,
        AssetImageRes.themText,
        onInkWell: () => controller.themeSetting(),
        text: StringRes.view,
      );
    },
  );
}

///------------------------------------review---------------------------------///
Widget review() {
  return GetBuilder<SettingPageController>(
    id: "review",
    builder: (controller) {
      return commonText(
        AssetImageRes.textBg,
        AssetImageRes.reviewText,
        onInkWell: () => controller.reviewSetting(),
        text: '⭐⭐⭐',
      );
    },
  );
}

///------------------------------------music--------------------------------------///
Widget music() {
  return GetBuilder<SettingPageController>(
    id: "sound",
    builder: (controller) {
      return commonText(AssetImageRes.textBg, AssetImageRes.musicText,
          onInkWell: () {},
          icon: controller.musicBool ? Icons.music_off : Icons.music_note,
          onPressedButton: () => controller.musicButton());
    },
  );
}

///------------------------------------------Sound---------------------------------///
Widget soundSetting() {
  return GetBuilder<SettingPageController>(
    id: "tapSound",
    builder: (controller) {
      return commonText(
        AssetImageRes.textBg,
        AssetImageRes.soundText,
        onInkWell: () {},
        icon: controller.soundBool ? Icons.volume_off : Icons.volume_up,
        onPressedButton: () => controller.soundButton(),
      );
    },
  );
}

///------------------------------More Game--------------------------///
Widget moreGame() {
  return GetBuilder<SettingPageController>(
    id: "moreGame",
    builder: (controller) {
      return commonText(AssetImageRes.textBg, AssetImageRes.moreGameText,
          onInkWell: () => controller.moreGameSetting(), text: StringRes.view);
    },
  );
}

///---------------------------------------Help and Support--------------------------///
Widget helpSupport() {
  return GetBuilder<SettingPageController>(
    id: "help",
    builder: (controller) {
      return commonText(AssetImageRes.textBg, AssetImageRes.helpText,
          onInkWell: () => controller.helpSetting(), text: StringRes.view);
    },
  );
}

///---------------------------------------Privacy Policy---------------------------///
Widget privacyPolicy() {
  return GetBuilder<SettingPageController>(
    id: "privacy",
    builder: (controller) {
      return commonText(AssetImageRes.textBg, AssetImageRes.privacyText,
          onInkWell: () => controller.privacySetting(), text: StringRes.view);
    },
  );
}
