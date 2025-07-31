
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';
import 'custom_svg.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Gradient? gradient;
  final bool isGradientColor;
  final bool isBorder;
  final Border? border;
  final Color borderColor;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool isPrefixEnable;
  final String? icon;
  final double? iconSize;
  final double? borderRadius;
  final Color? iconColor;

  const CustomButton({
    super.key,
    this.title,
    this.gradient,
    this.isGradientColor = true,
    this.isBorder = false,
    this.border,
    this.borderColor = AppColors.kGrayColor300,
    this.borderRadius,
    this.onTap,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.isPrefixEnable = false,
    this.icon,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      // Same border radius as Container
      child: Container(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 20.r,
              vertical: 10.r,
            ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.kPrimaryColor,
            gradient: isGradientColor
                ? gradient ??
                    (onTap != null
                        ? AppColors.kButtonGradient
                        : LinearGradient(
                            colors: [
                              const Color(0xFF4E54CB).withOpacity(0.2),
                              const Color(0xFF17A0B2).withOpacity(0.186),
                            ], // Blue and purple gradient
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ))
                : null, // Apply the gradient
            borderRadius: BorderRadius.circular(borderRadius ?? 100.r),
            border: isBorder
                ? border ?? Border.all(color: borderColor, width: 1)
                : null // Rounded corners
            ),
        child: isPrefixEnable
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvg(
                    icon: icon!,
                    size: iconSize ?? 24.r,
                    color: iconColor,
                  ),
                  10.horizontalSpace,
                  Text(
                    title ?? "",
                    style: textStyle ??
                        kTitleMedium.copyWith(
                            color: textColor ?? AppColors.kWhiteColor),
                  )
                ],
              )
            : Text(
                title ?? "",
                style: textStyle ??
                    kTitleMedium.copyWith(
                        color: textColor ?? AppColors.kWhiteColor),
              ),
      ),
    );
  }
}
