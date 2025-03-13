import 'package:ape_nft/constants/duration.dart';
import 'package:ape_nft/constants/extensions.dart';
import 'package:flutter/material.dart';

const int largeScreenSize = 1366; //tv
const int mediumScreenSize = 768; //laptop
const int smallScreenSize = 360; // phones etc
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) =>
      context.screenWidth < mediumScreenSize;
  static bool isMediumScreen(BuildContext context) =>
      context.screenWidth >= mediumScreenSize &&
      context.screenWidth < largeScreenSize;
  static bool isLargeScreen(BuildContext context) =>
      context.screenWidth >= largeScreenSize;
  static bool isCustomScreen(BuildContext context) =>
      context.screenWidth >= mediumScreenSize &&
      context.screenWidth <= customScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        return AnimatedSwitcher(
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeOutBack,
          duration: medDuration,
          child: () {
            if (width >= largeScreenSize) {
              return largeScreen;
            } else if (width < largeScreenSize && width >= mediumScreenSize) {
              return mediumScreen ?? largeScreen;
            } else {
              return smallScreen ?? largeScreen;
            }
          }(),
        );
      },
    );
  }
}
