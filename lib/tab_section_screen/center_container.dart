import 'package:flutter/material.dart';
import 'package:xuhui_widget/constant/view_width.dart';

class CenterContainer extends StatelessWidget {
  const CenterContainer({
    Key? key,
    required this.isNotMobileWidth,
    required this.isTabletWidth,
    required this.deviceWidth,
    required this.centerContainerContent,
  }) : super(key: key);

  final bool isNotMobileWidth;
  final bool isTabletWidth;
  final double deviceWidth;
  final Widget centerContainerContent;

  @override
  Widget build(BuildContext context) {
    double nonMobileCenterContainerWidth = ViewWidth.desktopLeftContainer;
    if (isTabletWidth) {
      nonMobileCenterContainerWidth = ViewWidth.tabletLeftContainer;
    }

    double centerContainerRightMargin = 16;
    if (deviceWidth < ViewWidth.maxTablet) {
      centerContainerRightMargin = 0;
    }

    double reducedWidthToCaterToShadow = 620;

    if (isNotMobileWidth) {
      // Tablets or bigger screens
      return Container(
        // Margin is only present when right side container is present in tablets or bigger screens
        margin: EdgeInsets.only(right: centerContainerRightMargin),
        width: nonMobileCenterContainerWidth -
            centerContainerRightMargin -
            reducedWidthToCaterToShadow,
        // constraints: BoxConstraints.expand(width: nonMobileCenterContainerWidth),
        child: centerContainerContent,
      );
    } else {
      // Mobile screens
      return SizedBox(
        width: deviceWidth,
        // constraints: BoxConstraints.expand(width: deviceWidth),
        child: centerContainerContent,
      );
    }
  }
}
