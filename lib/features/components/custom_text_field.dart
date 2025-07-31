import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';
import '../../generated/assets.dart';
import 'custom_svg.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onPress;
  final VoidCallback? fieldClick;
  final ValueChanged<String>? onChanged;

  // final InputDecoration? decoration = const InputDecoration();
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? borderColor;
  final Function? validation;
  final TextInputType? keyboardType;
  final String? errorText;
  final double? prefixIconSizeWidth;
  final double? prefixIconSizeHeight;
  final double? suffixIconSizeWidth;
  final double? suffixIconSizeHeight;
  final EdgeInsetsGeometry? suffixIconPadding;
  final double? errorTextHeight;
  final double? hintTextSize;
  final double? height;
  final double? width;
  final double? radius;
  final Function(String)? onSaved;
  final bool? isEmail;
  final bool isPassword;
  final bool isSecure;
  final bool readOnly;
  final bool isDense;
  final double? borderThink;
  final TextInputAction? textInputAction;
  final TextStyle? errorStyle;
  final Color? underLineBorderColor;
  final FocusNode? focusNode;
  final bool isError;
  final bool isOptional;
  final bool isLength;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final TapRegionCallback? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final BoxConstraints? prefixIconConstraints;


  const CustomTextField({
    super.key,
    this.title,
    this.hint,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.onPress,
    this.errorText,
    this.prefixIconColor,
    this.suffixIconColor,
    this.fillColor,
    this.hintColor,
    this.onSaved,
    this.keyboardType,
    this.isEmail,
    this.borderThink,
    this.validation,
    this.prefixIconSizeWidth,
    this.prefixIconSizeHeight,
    this.suffixIconSizeWidth,
    this.suffixIconPadding,
    this.suffixIconSizeHeight,
    this.onChanged,
    this.errorTextHeight,
    this.textColor,
    this.hintTextSize,
    this.height,
    this.width,
    this.radius,
    this.fieldClick,
    this.borderColor,
    this.isPassword = false,
    this.isSecure = false,
    this.readOnly = false,
    this.isDense = false,
    this.isLength = false,
    this.textInputAction = TextInputAction.next,
    this.errorStyle,
    this.underLineBorderColor,
    this.focusNode,
    this.isError = false,
    this.isOptional = true,
    this.hintStyle,
    this.titleStyle,
    this.onTapOutside,
    this.maxLines,
    this.minLines,
    this.inputFormatters,
    this.maxLength,
    this.prefixIconConstraints,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;

  @override
  void initState() {
    isVisible = widget.isSecure;
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.title != null ? true : false,
          child: Row(
            children: [
              Flexible(
                child: Text(
                  widget.title ?? "",
                  style: widget.titleStyle ??
                      kBodyMedium3.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kGrayColor900,
                      ),
                ),
              ),
              widget.isOptional
                  ? const SizedBox.shrink()
                  : Transform.translate(
                      offset: const Offset(2, -2),
                      child: Text(
                        "*",
                        style:
                            kBodyMedium3.copyWith(color: AppColors.kError600),
                      ),
                    )
            ],
          ),
        ),
        Visibility(
            visible: widget.title != null ? true : false,
            child: SizedBox(height: 5.h)),
        TextFormField(
          buildCounter: widget.maxLength != null
              ? (
                  BuildContext context, {
                  required int currentLength,
                  required bool isFocused,
                  required int? maxLength,
                }) {
                  return widget.isLength
                      ? Text(
                          '$currentLength/${maxLength ?? ""}',
                          style: kBodySmall2.copyWith(
                              color: AppColors.kGrayColor300),
                        )
                      : null;
                }
              : null,
          readOnly: widget.readOnly,
          textAlign: TextAlign.start,
          obscureText: isVisible,
          cursorColor: AppColors.kTextPrimaryColor,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          obscuringCharacter: "*",
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          // maxLength: 3,
          minLines: widget.minLines,
          style: kBodyMedium2.copyWith(
            color: widget.textColor ?? AppColors.kGrayColor900,
            decoration: TextDecoration.none,
            decorationThickness: 0,
          ),
          onTap: widget.fieldClick ?? () {},
          inputFormatters: widget.inputFormatters ??
              [
                if (widget.keyboardType == TextInputType.number) ...[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+(\.\d{0,6})?$')),
                ] else if (widget.keyboardType == TextInputType.text) ...[
                  FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9 ]*")),
                ],
                // if (widget.keyboardType == TextInputType.name) ...[
                //   FilteringTextInputFormatter.deny(RegExp(r"[0-9]")),
                //   FilteringTextInputFormatter.deny(
                //     RegExp(r'[~!@#$%^&*()_+`{}|<>?;:.,=[\]\\/\-]'),
                //   ),
                // ]
              ],
          decoration: InputDecoration(
            errorMaxLines: 3,
            contentPadding: EdgeInsets.symmetric(
              vertical: widget.height ?? 17.h,
              horizontal: widget.width ?? 16.w,
            ),
            //counter: const Offstage(),
            isDense: widget.isDense,
            prefixIconConstraints: widget.prefixIconConstraints ??
                BoxConstraints.tight(
                  Size(
                    widget.prefixIconSizeWidth ?? 45.r,
                    widget.prefixIconSizeHeight ?? 45.r,
                  ),
                ),
            suffixIconConstraints: BoxConstraints.tight(
              Size(
                widget.suffixIconSizeWidth ?? 45.r,
                widget.suffixIconSizeHeight ?? 45.r,
              ),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? RPadding(
                    padding: REdgeInsets.only(right: 18.w),
                    child: InkWell(
                      onTap: _toggleVisibility,
                      child:Container(),
                    ),
                  )
                : widget.suffixIcon == null
                    ? null
                    : InkWell(
                        onTap: widget.onPress,
                        child: Padding(
                          padding:  widget.suffixIconPadding ?? EdgeInsets.only(top: 8.0),
                          child: widget.suffixIcon,
                        ),
                      ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.isError
                      ? AppColors.kError600
                      : widget.borderColor ?? AppColors.kBorderColor,
                  width: 1.0),
              borderRadius: BorderRadius.circular(widget.radius ?? 16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.kError600
                    : widget.borderColor ?? AppColors.kBorderColor,
                width: widget.borderThink ?? 2.0,
              ),
              borderRadius: BorderRadius.circular(widget.radius ?? 16).r,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.kError600
                    : widget.borderColor ?? AppColors.kBorderColor,
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(widget.radius ?? 16).r,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.kError950
                    : widget.borderColor ?? AppColors.kBorderColor,
                width: widget.borderThink ?? 2.0,
              ),
              borderRadius: BorderRadius.circular(widget.radius ?? 16).r,
            ),
            filled: true,
            errorStyle: TextStyle(
              height: 0,
              fontWeight: regularFont,
              fontFamily: kPoppinsFamily,
            ),
            hintStyle: widget.hintStyle ??
                kBodyMedium2.copyWith(
                  fontSize: widget.hintTextSize ?? 16.sp,
                  color: widget.hintColor ?? AppColors.kGrayColor500,
                  fontWeight: FontWeight.w400,
                ),
            hintText: widget.hint ?? "",
            errorText: widget.errorText,
            fillColor: widget.fillColor ?? AppColors.kGrayColor50,
          ),
          validator: widget.validation as String? Function(String?)?,
          onSaved: widget.onSaved as String? Function(String?)?,
          onTapOutside: widget.onTapOutside,
        ),
      ],
    );
  }
}
