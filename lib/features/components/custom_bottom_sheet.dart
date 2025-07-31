import 'package:tn_test/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app/app_context.dart';
import '../../core/constants/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CustomBottomSheet({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: color,
          borderRadius: color != null
              ? const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )
              : null),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).copyWith().size.height -
            (MediaQueryData.fromView(View.of(context)).padding.top + 50),
      ),
      child: child,
    );
  }
}

void showCustomBottomSheet({
  String? title,
  Widget? contents,
  Widget? bottomContents,
}) {
  showModalBottomSheet(
    isDismissible: false,
    enableDrag: true,
    constraints: BoxConstraints(maxHeight: .7.sh),
    isScrollControlled: true,
    context: GetContext.context,
    backgroundColor: AppColors.kWhiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ).r,
    ),
    builder: (BuildContext sheetContext) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: 5,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              children: [
                if (title != null)
                  Text(
                    title,
                    style: kHeading.copyWith(color: AppColors.kPrimaryColor900),
                  ),
                Spacer(),
                InkWell(
                  onTap: () => GetContext.back(),
                  child: Icon(Icons.close, size: 20,color: AppColors.kPrimaryColor900),
                ),
              ],
            ),
            // 24.verticalSpace,
            if (contents != null) contents,
            24.verticalSpace,
            if (bottomContents != null) bottomContents
          ],
        ),
      );
    },
  );
}
