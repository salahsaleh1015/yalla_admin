

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';

import '../../../../core/resources/font_manager.dart';

import 'dart:ui';

Future<void> showCustomDialog(
    BuildContext context, {
      required Widget content,
      required String dialogTitle,
      required String actionButtonHint,
      Color? actionButtonColor,
    }) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dialog",
    barrierColor: Colors.black.withValues(alpha: 0.2),
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) {
      return SafeArea(
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // 🔥 blur
            child: CustomDialog(
              content: content,
              dialogTitle: dialogTitle,
              actionButtonHint: actionButtonHint,
              actionButtonColor: actionButtonColor,
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      // Fade
      final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOut),
      );

      // Scale (iOS style)
      final scale = Tween<double>(begin: 0.9, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ),
      );

      return FadeTransition(
        opacity: fade,
        child: ScaleTransition(
          scale: scale,
          child: child,
        ),
      );
    },
  );
}

class CustomDialog extends StatelessWidget {
  final Widget content;
  final String dialogTitle;
  final String actionButtonHint;

  final Color? actionButtonColor;

  const CustomDialog({
    super.key,
    required this.content,
    required this.dialogTitle,
    required this.actionButtonHint,

    this.actionButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.white,
      contentPadding: EdgeInsets.all(AppPadding.p8.r),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dialogTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: FontSize.s22),
                ),
                SizedBox(
                  width: AppSize.s70.w,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: ColorManager.secondaryTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            Divider(
              thickness: 1,
              color: ColorManager.secondaryTextColor,
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            content,
          ],
        ),
      ),

    );
  }
}

// // Function to show the dialog
// Future<void> showCustomDialog(BuildContext context, {
//   required Widget content,
//   required String dialogTitle,
//   required String actionButtonHint,
//   Color? actionButtonColor,
// }) {
//   return showDialog<void>(
//    context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return CustomDialog(
//         content: content,
//         dialogTitle: dialogTitle,
//         actionButtonHint: actionButtonHint,
//         actionButtonColor: actionButtonColor,
//       );
//     },
//   );
// }



