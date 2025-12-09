
import 'package:flutter/material.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';

class GlobalAdsBarWidget extends StatelessWidget {
  const GlobalAdsBarWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("شركاء الاعلانات",style: Theme.of(context).textTheme.bodyMedium,),
        TextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Text("عرض",style: Theme.of(context).textTheme.labelLarge,),
              Icon(Icons.arrow_forward,color: ColorManager.primary,)
            ],
          ),),
      ],
    );
  }
}
