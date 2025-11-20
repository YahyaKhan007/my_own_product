import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/themes/controller/theme_controller.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final double? height;
  final String? prefixIcon;
  final bool? icon;
  final String? keyValue;
  final String? hintText;
  final String? initialValue;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final VoidCallback? onSuffixClicked;
  final Function(String)? onFieldSubmitted;
  final RxBool? obsecureText;
  final bool border;
  final bool shadow;
  final bool divider;
  final TextInputType? textInputType;
  final int maxLines;
  final Color? color;
  final Color? bgcolor;
  final List<TextInputFormatter>? inputFormatters;
  final bool readonly;
  final VoidCallback? onTap;
  final double? radius;
  final int? maxLength;
  final String? mask;
  // final MaskTextInputFormatter? maskFormatter;
  final Color? iconColor;
  final bool? enabled;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;

  final RxBool showPassword = true.obs;
  final RxString errorMessage = RxString("");

  CustomTextField({
    super.key,
    this.controller,
    this.height,
    this.onSuffixClicked,
    this.prefixIcon,
    this.icon = true,
    this.keyValue = "1",
    this.hintText,
    this.initialValue,
    this.suffixIcon,
    this.validate,
    required this.onChange,
    this.onFieldSubmitted,
    this.border = false,
    this.shadow = false,
    this.divider = true,
    this.textInputType,
    this.maxLines = 1,
    this.maxLength = 300,
    this.color,
    this.inputFormatters,
    this.readonly = false,
    this.onTap,
    this.radius,
    this.iconColor,
    this.enabled,
    this.bgcolor,
    this.obsecureText,
    this.mask,
    // this.maskFormatter,
    this.textAlign = TextAlign.start,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    // final effectiveFormatter = maskFormatter ??
    //     (mask != null ? MaskTextInputFormatter(mask: mask) : null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: height ?? 48,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: bgcolor ??
                  themeController.selectedThemeData.value.colorScheme.secondary,
              borderRadius: BorderRadius.circular(radius ?? 12),
              boxShadow: shadow
                  ? [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ]
                  : [],
            ),
            child: Obx(
                  () => TextFormField(
                textAlign: textAlign!,
                textAlignVertical: TextAlignVertical.center,
                initialValue: initialValue,
                enabled: enabled ?? true,
                maxLength: maxLength,
                style: themeController
                    .selectedThemeData.value.textTheme.bodyMedium,
                onTap: onTap,
                readOnly: readonly,
                controller: controller,
                keyboardType: textInputType ?? TextInputType.text,
                validator: (value) {
                  final message = onChange?.call(value ?? '') ?? '';

                  errorMessage.value = message;
                  // return null;
                },
                onChanged: (value) {
                  final message = onChange?.call(value) ?? '';

                  errorMessage.value = message;
                },
                inputFormatters: [
                  ...?inputFormatters,
                ],
                cursorColor:
                themeController.selectedThemeData.value.iconTheme.color,
                obscureText: textInputType == TextInputType.visiblePassword
                    ? showPassword.value
                    : false,
                maxLines: maxLines,
                decoration: InputDecoration(
                  suffixIconConstraints: BoxConstraints(maxWidth: 60),
                  hintText: hintText?.tr,
                  isCollapsed: true,
                  contentPadding: contentPadding ?? const EdgeInsets.all(0),
                  fillColor: Colors.transparent,
                  filled: true,
                  counterText: '',
                  prefix: prefixIcon != null ? null : SizedBox(width: 20),
                  prefixIcon: prefixIcon != null
                      ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 10),
                        child: Image.asset(
                          prefixIcon!,
                          height: 25,
                          width: 25,
                          color: iconColor ?? AppColors.buttonColor,
                        ),
                      ),
                    ],
                  )
                      : null,
                  suffixIcon: textInputType == TextInputType.visiblePassword
                      ? Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        showPassword.value = !showPassword.value;
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Obx(() => Text(
                          showPassword.value
                              ? "show"
                              : "hide",
                          style: themeController.selectedThemeData
                              .value.textTheme.bodySmall!
                              .copyWith(
                            color: AppColors.buttonColor,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                      ),
                    ),
                  )
                      : suffixIcon,
                  hintStyle: themeController
                      .selectedThemeData.value.textTheme.bodyMedium!
                      .copyWith(
                    fontWeight: FontWeight.normal,
                    color: themeController.selectedThemeData.value.dividerColor,
                  ),
                  focusedErrorBorder: border
                      ? OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.red, width: 1.5),
                    borderRadius: BorderRadius.circular(radius ?? 18),
                  )
                      : InputBorder.none,
                  focusedBorder: border
                      ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.buttonColor, width: 1.5),
                    borderRadius: BorderRadius.circular(radius ?? 18),
                  )
                      : InputBorder.none,
                  enabledBorder: border
                      ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: shadow
                          ? Colors.transparent
                          : const Color(0xff8D8D8D).withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(radius ?? 18),
                  )
                      : InputBorder.none,
                  isDense: false,
                  disabledBorder: InputBorder.none,
                ),
              ).paddingOnly(right: 16),
            ),
          ),
        ),
        Obx(
              () {
            return errorMessage.value.isNotEmpty
                ? Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                errorMessage.value,
                style: themeController
                    .selectedThemeData.value.textTheme.bodySmall
                    ?.copyWith(
                  color: AppColors.buttonColor,
                  fontSize: 12,
                ),
              ),
            )
                : const SizedBox(height: 10);
          },
        ),
      ],
    );
  }
}
