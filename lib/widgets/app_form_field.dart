import 'package:fleet_manager/shared/themes/app_colors.dart';
import 'package:fleet_manager/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String value) onChanged;
  final IconData? prefixIcon;
  final bool? isPassword;
  final bool? enabled;
  final bool? filled;
  final String? errorText;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFormField(
      {super.key,
      this.label,
      this.controller,
      this.filled,
      this.hintText,
      this.prefixIcon,
      this.isPassword,
      this.enabled,
      this.errorText,
      this.textCapitalization,
      this.keyboardType,
      this.inputFormatters,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);

    return Column(children: [
      Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.blackBlue,
                  fontWeight: FontWeight.w700,
                ),
                label ?? '',
              ),
            ),
          )),
      TextFormField(
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          onChanged: onChanged,
          controller: controller,
          obscureText: null == isPassword ? false : true,
          style: AppTextStyles.h6,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              errorText: errorText,
              hintText: hintText,
              hintStyle: AppTextStyles.h6.copyWith(color: AppColors.greyBlue),
              filled: filled ?? true,
              fillColor: AppColors.greyBackground2,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.0,
                  ),
                  borderRadius: borderRadius),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 3, color: AppColors.greyBackground2),
                borderRadius: borderRadius,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.greyBackground2,
                  width: 1.0,
                ),
                borderRadius: borderRadius,
              ),
              enabled: null == enabled ? true : false,
              contentPadding: const EdgeInsets.all(16)))
    ]);
  }
}
