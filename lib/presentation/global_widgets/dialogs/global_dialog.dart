

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_button_widget.dart';

import '../../../../core/resources/font_manager.dart';



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
      content: Column(
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
      // actions: <Widget>[
      //   Padding(
      //     padding: EdgeInsets.all(AppSize.s2.r),
      //     child: GlobalButtonWidget(
      //       isButtonEnabled: true,
      //       height: AppSize.s40.h,
      //       color: actionButtonColor ?? ColorManager.primary,
      //       onTap: actionButtonCallBack,
      //       width: MediaQuery.of(context).size.width * 0.8,
      //       text: actionButtonHint,
      //     ),
      //   ),
      // ],
    );
  }
}

// Function to show the dialog
Future<void> showCustomDialog(BuildContext context, {
  required Widget content,
  required String dialogTitle,
  required String actionButtonHint,
  Color? actionButtonColor,
}) {
  return showDialog<void>(
   context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CustomDialog(
        content: content,
        dialogTitle: dialogTitle,
        actionButtonHint: actionButtonHint,
        actionButtonColor: actionButtonColor,
      );
    },
  );
}



