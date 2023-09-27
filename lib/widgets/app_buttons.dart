import 'package:fleet_manager/shared/themes/app_colors.dart';
import 'package:fleet_manager/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final String label;
  final bool isLoading;
  final bool isEnabled;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final BorderSide? borderSide;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height,
    this.textStyle,
    this.isLoading = false,
    this.isEnabled = true,
    this.foregroundColor,
    this.backgroundColor,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 53,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          disabledBackgroundColor:
              isEnabled == false ? AppColors.greyBackground2 : null,
          side: borderSide ?? const BorderSide(color: Colors.transparent),
          textStyle: textStyle ?? AppTextStyles.h6,
          foregroundColor: foregroundColor ?? AppColors.white,
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: isLoading || !isEnabled ? null : onPressed,
        child: child(),
      ),
    );
  }

  Widget child() {
    if (isLoading) {
      return const SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
        ),
      );
    } else {
      return Text(label);
    }
  }
}

class LabelIconButton extends StatelessWidget {
  const LabelIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      this.textColor,
      this.buttonColor});

  final Function() onPressed;
  final IconData icon;
  final Color? textColor;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 200,
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: const BorderSide(color: AppColors.blackBlue),
          ),
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 24.0,
            color: buttonColor ?? AppColors.blackBlue,
          ),
          label: Text(
            'Escanear',
            style: TextStyle(color: textColor ?? AppColors.blackBlue),
          ),
        ),
      ),
    );
  }
}
