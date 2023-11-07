import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tik/utils/asset_res.dart';
import 'package:getx_tic_tik/utils/color_res.dart';
import 'package:getx_tic_tik/utils/string_res.dart';

///-------------Tic Tac Toe---------------------------------------///
Widget ticTacToe() {
  return Padding(
    padding:
        EdgeInsets.only(top: Get.height * 0.12, bottom: Get.height * 0.020),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width * 0.8,
          child: Stack(
            children: [
              Center(
                child: Text(
                  StringRes.ticTac,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.5,
                    height: 1.10,
                    shadows: const [
                      Shadow(
                        blurRadius: 15.0,
                        color: ColorsRes.blackColor,
                        offset: Offset(0, 8.0),
                      )
                    ],
                    fontSize: Get.height * 0.075,
                    fontFamily: StringRes.sigmar,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 12
                      ..color = const Color(0xFF2196F3),
                  ),
                ),
              ),
              Center(
                child: Text(
                  StringRes.ticTac,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.6,
                    height: 1.10,
                    shadows: const [
                      Shadow(
                        blurRadius: 10.0,
                        color: ColorsRes.blackColor,
                        offset: Offset(0, 1.0),
                      )
                    ],
                    fontSize: Get.height * 0.075,
                    fontFamily: StringRes.sigmar,
                    color: ColorsRes.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

///----------------------------------HomePage Box----------------------///
Widget playWithBox() {
  return Align(
    alignment: Alignment.center,
    child: SizedBox(
        height: Get.height * 0.13,
        child: Image.asset(AssetImageRes.friendImage)),
  );
}

// ///------------------------vs------------------------------------///
// Widget vs() {
//   return Stack(
//     children: <Widget>[
//       Text(
//         StringRes.vs,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           shadows: const [
//             Shadow(
//               blurRadius: 6.0,
//               color: Colors.black,
//               offset: Offset(0, 2.0),
//             )
//           ],
//           fontSize: Get.width * 0.04,
//           fontFamily: StringRes.sigmar,
//           foreground: Paint()
//             ..style = PaintingStyle.stroke
//             ..strokeWidth = 3
//             ..color = const Color(0xFF2196F3),
//         ),
//       ),
//       Text(
//         StringRes.vs,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           shadows: const [
//             Shadow(
//               blurRadius: 5.0,
//               color: Colors.black,
//               offset: Offset(0, 2.0),
//             )
//           ],
//           fontSize: Get.width * 0.04,
//           fontFamily: StringRes.sigmar,
//           color: Colors.white,
//         ),
//       ),
//     ],
//   );
// }

///------------------------Play With Friend Text----------------------------------------///
// Widget playWithFriend() {
//   return Stack(
//     children: <Widget>[
//       Text(
//         StringRes.playWithFriend,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           shadows: const [
//             Shadow(
//               blurRadius: 6.0,
//               color: Colors.black,
//               offset: Offset(0, 2.0),
//             )
//           ],
//           fontSize: Get.height * 0.014,
//           fontFamily: StringRes.sigmar,
//           foreground: Paint()
//             ..style = PaintingStyle.stroke
//             ..strokeWidth = 3
//             ..color = const Color(0xFF2196F3),
//         ),
//       ),
//       // Solid text as fill.
//       Text(
//         StringRes.playWithFriend,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           shadows: const [
//             Shadow(
//               blurRadius: 5.0,
//               color: ColorsRes.blackColor,
//               offset: Offset(0, 2.0),
//             )
//           ],
//           fontSize: Get.height * 0.014,
//           fontFamily: StringRes.sigmar,
//           color: ColorsRes.white,
//         ),
//       ),
//     ],
//   );
// }

// Widget playWithBox() {
//   return Align(
//     child: Container(
//       height: Get.height * 0.18,
//       width: Get.width * 0.60,
//       decoration: const BoxDecoration(
//           image: DecorationImage(image: AssetImage(AssetImageRes.iconBg))),
//       child: Padding(
//         padding:
//             EdgeInsets.only(top: Get.height * 0.045, left: Get.width * 0.010),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: Get.width * 0.070, vertical: Get.height * 0.0060),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Image.asset(AssetImageRes.person, scale: 4.5),
//                   vs(),
//                   Image.asset(AssetImageRes.person, scale: 4.5),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 playWithFriend(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
