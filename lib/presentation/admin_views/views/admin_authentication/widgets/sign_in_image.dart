import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalla_admin/core/resources/assets_manager.dart';

class SignInImage extends StatelessWidget {
  const SignInImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsManager.authImage,
      fit: BoxFit.fill,
      width: MediaQuery.sizeOf(context).width * 0.6,
      height: MediaQuery.sizeOf(context).height * 0.3,
    );
  }
}