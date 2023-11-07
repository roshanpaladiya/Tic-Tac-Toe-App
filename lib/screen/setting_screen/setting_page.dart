import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/screen/setting_screen/setting_controller.dart';
import 'package:getx_tic_tik/screen/setting_screen/setting_page_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingPageController());
    return SafeArea(
      child: Scaffold(
        body: settingBody(),
      ),
    );
  }
}
