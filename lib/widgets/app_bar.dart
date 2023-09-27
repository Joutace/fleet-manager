import 'package:fleet_manager/shared/themes/app_colors.dart';
import 'package:fleet_manager/shared/themes/app_text_styles.dart';
import 'package:fleet_manager/widgets/circle_icon.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? rightIcon;
  final bool showBack;
  final Color? backgroundColor;
  final Function? rightButtonClick;
  final Function? backButtonClick;

  AppBarWidget({
    super.key,
    this.title,
    this.showBack = true,
    this.rightIcon,
    this.backgroundColor,
    this.rightButtonClick,
    this.backButtonClick,
  }) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor ?? Colors.transparent,
          leading: Visibility(
            visible: showBack,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: () => backButtonClick?.call() ?? Navigator.pop(context),
                child: CircleIcon(Icons.keyboard_arrow_left_outlined),
              ),
            ),
          ),
          actions: <Widget>[
            rightIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: InkWell(
                      onTap: () => rightButtonClick?.call(), // Image tapped
                      child: CircleIcon(rightIcon!),
                    ),
                  )
                : const SizedBox()
          ],
          title: Text(
            title ?? '',
            style: AppTextStyles.h6.copyWith(
                color: AppColors.darkBlue, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
