import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/themes/controller/theme_controller.dart';
import 'package:my_own_product/core/utils/custom_text.dart';

class EmailLoginButton extends StatelessWidget {
  final String buttonText;
  final String iconPath;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;

  const EmailLoginButton({
    super.key,
    required this.buttonText,
    required this.iconPath,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(iconPath),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: CustomText(
                text: buttonText,
                textStyle: TextStyle(
                  fontSize: 12,
                  color: textColor ?? Colors.black,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 10),
      ),
    );
  }
}

class SocialLogin extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;
  const SocialLogin({
    super.key,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(Icons.facebook).paddingAll(16),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? spreadRadius;
  final double? blurRadius;
  final Color? color;
  final bool isExpanded;
  final Color? shadowColor;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;

  // BoxShape? shape;
  final Offset? offset;
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.spreadRadius,
    this.blurRadius,
    this.color,
    required this.isExpanded,
    this.shadowColor,
    this.borderColor,
    this.borderWidth,
    this.onTap,
    this.offset,
    this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.all(0),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        decoration: BoxDecoration(
          border: borderColor == null
              ? null
              : Border.all(color: borderColor!, width: borderWidth ?? 1),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          color: color ?? themeController.selectedThemeData.value.scaffoldBackgroundColor,
          boxShadow: shadowColor == null
              ? null
              : [
            BoxShadow(
              color: shadowColor ?? AppColors.buttonColor.withValues(alpha: 0.5),
              spreadRadius: spreadRadius ?? 5,
              blurRadius: blurRadius ?? 7,
              offset: offset ?? const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
