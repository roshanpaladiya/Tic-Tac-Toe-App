import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/screen/playing_screen/play_controller.dart';
import 'package:getx_tic_tik/screen/playing_screen/playing_page_widget.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PlayScreenController());
    return SafeArea(
      child: Scaffold(
        body: playPageBody(),
      ),
    );
  }
}
