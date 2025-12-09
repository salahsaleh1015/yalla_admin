
import 'package:flutter/material.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/presentation/global_widgets/global_decorated_container.dart';

class GlobalProfileCardWidget extends StatelessWidget {
  const GlobalProfileCardWidget({super.key, required this.fieldName, required this.fieldValue, this.height});
 final String fieldName;
  final String fieldValue;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(fieldName,style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: Text(fieldValue,
              maxLines: 3,
              textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: ColorManager.black
            ),),
          ),
        ],
      ),

    );
  }
}
