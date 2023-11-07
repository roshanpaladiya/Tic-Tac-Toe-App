import 'package:get/get.dart';
import 'package:getx_tic_tik/utils/sound_res.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  AudioPlayer homePageSong = AudioPlayer();
  AudioPlayer tapMusic = AudioPlayer();
  AudioPlayer win = AudioPlayer();

  Future<void> homePage() async {
    await homePageSong.setAsset(SoundRes.gameBgSound);
    if (homePageSong.playing) {
      homePageSong.stop();
    } else {
      homePageSong.play();
      homePageSong.setLoopMode(LoopMode.one);
    }
  }

  Future<void> winner() async {
    await win.setAsset(SoundRes.winSound);
    win.play();
  }

  Future<void> drawGame() async {
    await win.setAsset(SoundRes.drawSound);
    win.play();
  }

  Future<void> tapGame() async {
    await win.setAsset(SoundRes.tapGame);
    win.play();
  }

  Future<void> tapButtonSound() async {
    await tapMusic.setAsset(SoundRes.tapButtonSound);
    if (tapMusic.playing) {
      tapMusic.stop();
    } else {
      tapMusic.play();
      tapMusic.setLoopMode(LoopMode.off);
    }
  }
}
