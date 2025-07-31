import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tn_test/core/app/app_context.dart';
import 'package:tn_test/core/constants/app_colors.dart';
import 'package:tn_test/core/constants/app_text_style.dart';
import 'package:tn_test/generated/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final bool isActions;
  final bool isLogo;
  final bool isCart;
  final bool isCustomLeadingIcon;
  final bool? isBackEnable;
  final Widget? customLeadingIcon;
  final bool isSearch;
  final double leadingWidth;
  final double elevation;
  final double titleSpacing;
  final String? icon;
  final Color? shadowColor;
  final Color? backgroundColor;
  final Color? backButtonColor;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;

  const CustomAppBar(
      {super.key,
      this.title,
      this.centerTitle = true,
      this.isActions = false,
      this.isCart = false,
      this.isCustomLeadingIcon = false,
      this.customLeadingIcon,
      this.isSearch = false,
      this.leadingWidth = 55,
      this.elevation = 0,
      this.titleSpacing = 0,
      this.icon,
      this.shadowColor,
      this.backgroundColor,
      this.backButtonColor,
      this.onBackPress,
      this.actions,
      this.isLogo = false,
      this.isBackEnable});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        scrolledUnderElevation: 0,
        leading: (isBackEnable ?? false)
            ? InkWell(
                onTap: onBackPress ?? () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))
            : SizedBox.shrink(),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: centerTitle,
        backgroundColor: backgroundColor ?? AppColors.kPrimaryColor900,
        elevation: elevation,
        titleSpacing: titleSpacing,
        shadowColor: shadowColor ?? AppColors.kGrayColor100,
        title: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: kTitleLarge1.copyWith(
              color: AppColors.kWhiteColor, fontSize: 24.sp),
        ),
        actions: actions,
      ),
    );
  }
}
