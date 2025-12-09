import 'package:flutter/material.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
class GlobalAccountInfoBarWidget extends StatelessWidget {
  const GlobalAccountInfoBarWidget({super.key, required this.onPressed});


  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("المعلومات الشخصية",style: Theme.of(context).textTheme.bodyMedium,),
        TextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Text("تغيير",style: Theme.of(context).textTheme.labelLarge,),
              Icon(Icons.arrow_forward,color: ColorManager.primary,)
            ],
          ),),
      ],
    );
  }
}
