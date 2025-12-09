
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/core/resources/values_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/dialogs/add_ads_dialoge.dart';
import 'package:yalla_admin/presentation/global_widgets/global_admin_add_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_advertisement_grid_view_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_circular_button_widget.dart';
import 'package:yalla_admin/presentation/global_widgets/global_padding_widget.dart';

class AdminAddAdsView extends StatelessWidget {
  const AdminAddAdsView({super.key});

  static String id = "AdminAddAdsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalCircularButtonWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back),
                Text(
                  "شركاء الإعلانات",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: AppSize.s30.w,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            SizedBox(
              width: double.infinity,
              height: AppSize.s40.h,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المعلومات الشخصية",style: Theme.of(context).textTheme.bodyMedium,),
                   GlobalAdminAddButtonWidget(
                    text: "إضافة شريك الإعلان",
                    onTap: (){
                      addAdsDialog(context);
                    },
                  ),

                ],
              ),
            ),
            const GlobalAdvertisementGridViewWidget(),

          ],
        ),
      ),
    );
  }
}
