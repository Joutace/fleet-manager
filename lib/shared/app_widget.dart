import 'package:fleet_manager/shared/routes/app_router.dart';
import 'package:fleet_manager/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fleet Manager',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        primarySwatch: Colors.blue,
        highlightColor: AppColors.primary,
      ),
      routerConfig: router,
    );
  }
}
