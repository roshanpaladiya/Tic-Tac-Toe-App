import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/common_widget/size_common.dart';
import 'package:getx_tic_tik/screen/home_screen/home_page.dart';
import 'package:getx_tic_tik/screen/setting_screen/setting_page_widget.dart';
import 'package:getx_tic_tik/services/audio_screen.dart';
import 'package:getx_tic_tik/services/pref_service.dart';
import 'package:getx_tic_tik/services/service_res/url_res.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';
import 'package:getx_tic_tik/utils/color_res.dart';
import 'package:getx_tic_tik/utils/string_res.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPageController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  AudioController audio = Get.find<AudioController>();
  final Uri _url = Uri.parse(ServiceStringRes.helpAndSupport);
  final Uri _urlRate = Uri.parse(ServiceStringRes.ratUrl);
  final Uri _urlMoreGame = Uri.parse(ServiceStringRes.moreGame);
  String? getUserName;

  bool musicBool = false;
  bool soundBool = false;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void getUser() {
    getUserName = PrefService.getString("userName");
    update(["userDio"]);
  }

  ///----------------------------Setting Page Back Button---------------------///
  void settingBack() async {
    await audio.tapButtonSound();
    Get.back<HomePage>();
  }

  ///--------------------------------------User Name Box-----------------------///
  void userNameDialog() {
    audio.tapButtonSound();
    Get.dialog(Dialog(
      child: Container(
        height: Get.height * 0.2,
        width: Get.width * 0.7,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage(AssetImageRes.bgImage), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.1, vertical: Get.height * 0.015),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(
                    fontFamily: StringRes.sigmar, color: Colors.white),
                controller: userNameController,
                decoration: InputDecoration(
                    fillColor: Colors.transparent.withOpacity(0.1),
                    filled: true,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    label: const Text(
                      "Enter Name",
                      style: TextStyle(color: ColorsRes.white),
                    )),
              ),
              vertical(Get.height * 0.020),
              MaterialButton(
                onPressed: () async {
                  getUserName = userNameController.text;
                  await PrefService.setValue("userName", getUserName);
                  update(["userDio"]);
                  Get.back();
                },
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(AssetImageRes.textBg),
                  )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.1,
                        right: Get.width * 0.1,
                        top: 10,
                        bottom: 13),
                    child: Text(
                      StringRes.submitText,
                      style: TextStyle(
                          fontFamily: StringRes.sigmar,
                          color: ColorsRes.blackColor,
                          fontSize: Get.height * 0.025),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
    update(["userDio"]);
  }

  ///--------------------------------Theme---------------------///
  Future<void> themeSetting() async {
    await audio.tapButtonSound();
    update(["them"]);
  }

  ///-----------------------------More Game (Setting)--------------------------///
  Future<void> _launchUrlMoreGame() async {
    await audio.tapButtonSound();
    if (!await launchUrl(_urlMoreGame)) {
      throw Exception('Could not launch $_urlMoreGame');
    }
  }

  Future<void> moreGameSetting() async {
    await audio.tapButtonSound();
    _launchUrlMoreGame();
    update(["moreGame"]);
  }

  ///-------------------------------------------url launcher----------------------------///
  Future<void> _launchUrl() async {
    await audio.tapButtonSound();
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _launchUrlRate() async {
    await audio.tapButtonSound();
    if (!await launchUrl(_urlRate)) {
      throw Exception('Could not launch $_urlRate');
    }
  }

  ///-----------------------------------Help And Support--------------------///
  Future<void> helpSetting() async {
    await audio.tapButtonSound();
    _launchUrl();
    update(["help"]);
  }

  ///-------------------------------- Rate--------------------------------///
  Future<void> reviewSetting() async {
    await audio.tapButtonSound();
    _launchUrlRate();
    update(["review"]);
  }

  ///--------------------------------Music-------------------------///
  Future<void> musicButton() async {
    await audio.tapButtonSound();
    musicBool = !musicBool;
    audio.homePage();
    update(["sound"]);
  }

  ///--------------------------------------Sound--------------------------///
  Future<void> soundButton() async {
    await audio.tapButtonSound();
    soundBool = !soundBool;
    audio.tapButtonSound();
    update(["tapSound"]);
  }

  ///---------------------------------------Privacy Policy---------------------///
  Future<void> privacySetting() async {
    await audio.tapButtonSound();
    privacyDialog();
    update(["privacy"]);
  }
}
