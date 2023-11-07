import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/common_widget/size_common.dart';
import 'package:getx_tic_tik/screen/home_screen/home_page.dart';
import 'package:getx_tic_tik/screen/setting_screen/setting_page.dart';
import 'package:getx_tic_tik/services/audio_screen.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';
import 'package:getx_tic_tik/utils/string_res.dart';

import '../../services/ads/unity_ads.dart';

class PlayScreenController extends GetxController {
  bool tap = true;
  int player1 = 0;
  int player2 = 0;
  String winner = '';
  AudioController audio = Get.find<AudioController>();
  List data = ['', '', '', '', '', '', '', '', ''];
  String score = '';

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AdManager.loadUnityIntAd();
      await AdManager.loadUnityRewardedAd();
      AdManager.showBannerAd();
    });
  }

  ///--------------------------------------SettingButton PlayScreen Page--------------------///
  Future<void> onSettingPlayScreen() async {
    await audio.tapButtonSound();
    await AdManager.showIntAd();
    Get.to(() => const SettingPage());
  }

  ///--------------------------------------------PlayScreen To HomeScreen-------------------------///
  Future<void> onBackButton() async {
    await audio.tapButtonSound();
    Get.back();
  }

  ///--------------------------------Restart Button------------------------///
  Future<void> restartScreen() async {
    await audio.tapButtonSound();
    player1 = 0;
    player2 = 0;
    data = ['', '', '', '', '', '', '', '', ''];
    winner = '';
    update(["restart", "player", "tap", "line"]);
  }

  ///---------------------------------Play Again Button-----------------------------///
  Future<void> playAgain() async {
    data = ['', '', '', '', '', '', '', '', ''];
    winner = '';
    await audio.tapButtonSound();
    await AdManager.showIntAd();
    update(["tap", "line"]);
  }

  ///----------------------------------------------Game Logic------------------------///
  Future<void> onTapPlay(int index) async {
    if (data[index] == '') {
      if (tap) {
        await audio.tapGame();
        data[index] = AssetImageRes.diamond;
      } else {
        await audio.tapGame();
        data[index] = AssetImageRes.starX;
      }
      tap = !tap;
    }
    checkWinner();
    update(['tap']);
  }

  ///----------------------------------Winner Check----------------------------------------///
  Future<void> checkWinner() async {
    ///----------------------row winner--------------------------///
    if (data[0] == data[1] && data[0] == data[2] && data[0] != '') {
      winner = AssetImageRes.row1;
      winnerScore(data[1]);
      audio.winner();
      update(["line"]);
    } else if (data[3] == data[4] && data[3] == data[5] && data[3] != '') {
      winner = AssetImageRes.row2;
      winnerScore(data[4]);
      audio.winner();
      update(["line"]);
    } else if (data[6] == data[7] && data[6] == data[8] && data[6] != '') {
      winner = AssetImageRes.row3;
      winnerScore(data[7]);
      audio.winner();
      update(["line"]);
    }

    ///-------------------------------Column winner------------------------------------///
    else if (data[0] == data[3] && data[0] == data[6] && data[0] != '') {
      winner = AssetImageRes.c1;
      winnerScore(data[3]);
      audio.winner();
      update(["line"]);
    } else if (data[1] == data[4] && data[1] == data[7] && data[1] != '') {
      winner = AssetImageRes.c2;
      winnerScore(data[4]);
      audio.winner();
      update(["line"]);
    } else if (data[2] == data[5] && data[2] == data[8] && data[2] != '') {
      winner = AssetImageRes.c3;
      winnerScore(data[5]);
      audio.winner();
      update(["line"]);
    }

    ///-----------------------------cross winner-------------------------------------///
    else if (data[0] == data[4] && data[0] == data[8] && data[0] != '') {
      winner = AssetImageRes.cr2;
      winnerScore(data[4]);
      audio.winner();
      update(["line"]);
    } else if (data[2] == data[4] && data[2] == data[6] && data[2] != '') {
      winner = AssetImageRes.cr1;
      winnerScore(data[4]);
      audio.winner();
      update(["line"]);
    }

    ///-------------------------------Match Draw-----------------------///
    else {
      if (!data.any((element) => element == "")) {
        await audio.drawGame();
        // await AdManager.showIntAd();
        _drawDialog();
      }
    }
  }

  ///------------------------------Score Bord-----------------------------///
  void winnerScore(String data) {
    if (data == AssetImageRes.diamond) {
      player1++;
    } else {
      player2++;
    }
    update(["player"]);
  }

  ///-----------------------------------Match Draw Dialog Box----------------------------------///
  void machDraw() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: StringRes.matchDrawText,
        content: const Text("😇😇😇"),
        actions: [
          ElevatedButton(
              onPressed: () {
                data = ['', '', '', '', '', '', '', '', ''];
                player1 = 0;
                player2 = 0;
                Get.to(() => const HomePage());
              },
              child: const Text(StringRes.exitText)),
          ElevatedButton(
              onPressed: () {
                data = ['', '', '', '', '', '', '', '', ''];
                Get.back();
                update(["tap"]);
              },
              child: const Text(StringRes.playAgainText))
        ]);
  }

  void _drawDialog() {
    Get.dialog(Dialog(
      child: Container(
        height: Get.height * 0.2,
        width: Get.width * 0.6,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
              image: AssetImage(AssetImageRes.bgImage), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            vertical(10),
            Text(
              StringRes.matchDrawText,
              style: TextStyle(
                  fontSize: Get.height * 0.027, fontWeight: FontWeight.w700),
            ),
            vertical(Get.height * 0.020),
            const Text(
              "😇😇😇",
              style: TextStyle(fontSize: 20),
            ),
            vertical(Get.height * 0.020),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    data = ['', '', '', '', '', '', '', '', ''];
                    player1 = 0;
                    player2 = 0;
                    Get.to(() => const HomePage());
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
                      child: const Text(
                        StringRes.exitText,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    data = ['', '', '', '', '', '', '', '', ''];
                    Get.back();
                    update(["tap"]);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(AssetImageRes.textBg),
                    )),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.050,
                          right: Get.width * 0.050,
                          top: 10,
                          bottom: 13),
                      child: const Text(
                        StringRes.playAgainText,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
