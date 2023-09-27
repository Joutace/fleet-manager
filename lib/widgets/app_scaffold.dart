import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget? drawer;
  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final bool isTouchable;
  final bool isLoading;
  final bool extendBodyBehindAppBar;

  const AppScaffold(
      {super.key,
      this.drawer,
      required this.body,
      this.appBar,
      this.bottomNavigationBar,
      this.isTouchable = true,
      this.isLoading = false,
      this.extendBodyBehindAppBar = false});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !isTouchable || isLoading,
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
                appBar: appBar,
                drawer: drawer,
                body: body,
                bottomNavigationBar: bottomNavigationBar,
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                resizeToAvoidBottomInset: false),
            Visibility(
                visible: isLoading,
                child: Container(
                    color: Colors.black87,
                    child: const Center(child: CircularProgressIndicator())))
          ],
        ),
      ),
    );
  }
}
