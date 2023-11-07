import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/screen/playing_screen/playing_screen.dart';
import 'package:getx_tic_tik/services/ads/unity_ads.dart';
import 'package:getx_tic_tik/services/audio_screen.dart';
import 'package:getx_tic_tik/services/service_res/url_res.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../setting_screen/setting_page.dart';

class HomePageController extends GetxController {
  String link = '';
  AudioController audio = Get.put(AudioController());
  final Uri _url = Uri.parse(ServiceStringRes.moreGame);

  ///------------------------------------OnInit------------------------------------------///
  @override
  void onInit() {
    super.onInit();
    audio.homePage();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AdManager.loadUnityIntAd();
      await AdManager.loadUnityRewardedAd();
    });
  }

  ///------------------------onCLose---------------------------------///
  @override
  void onClose() {
    super.onClose();
    Get.find<AudioController>().homePageSong.stop();
  }

  ///-----------------------------------------Setting Button-----------------------------///
  Future<void> onTapSetting() async {
    await audio.tapButtonSound();
    await AdManager.showIntAd();
    Get.to(() => const SettingPage());
    update(["homePageSetting"]);
  }

  ///-----------------------------------------------Game Start Button----------------------------------///
  Future<void> onGameStartButton() async {
    await audio.tapButtonSound();
    await AdManager.showIntAd();
    update(["start"]);
    Get.to(() => const PlayPage());
  }

  ///----------------------------------------Share App Button-------------------------------------///
  void _onShare() async {
    await Share.share(ServiceStringRes.shareAppLink, subject: link);
  }

  void onShareButton() {
    audio.tapButtonSound();
    _onShare();
  }

  ///-------------------------------More Game Button------------------------------------------///
  Future<void> _launchUrl() async {
    await audio.tapButtonSound();
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void moreGameButton() {
    audio.tapButtonSound();
    _launchUrl();
    update(["moreGameHome"]);
  }
}
