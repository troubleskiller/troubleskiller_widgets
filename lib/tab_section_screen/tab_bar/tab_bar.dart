import 'package:flutter/material.dart';
import 'package:xuhui_widget/common_widget/custom_app_bar.dart';
import 'package:xuhui_widget/tab_section_screen/section_tab_bar.dart';

class MobileTickerHeader extends StatefulWidget {
  const MobileTickerHeader({
    Key? key,
    required this.sectionTabController,
    this.customSectionTabs,
    this.setSectionTabBarIndex,
    this.setHeaderExpandedHeight,
    this.isShowOption = false,
  }) : super(key: key);
  final TabController? sectionTabController;
  final Function? setSectionTabBarIndex;
  final List<Tab>? customSectionTabs;
  final bool isShowOption;

  final Function? setHeaderExpandedHeight;

  @override
  _MobileTickerHeaderState createState() => _MobileTickerHeaderState();
}

class _MobileTickerHeaderState extends State<MobileTickerHeader> {
  double? _dynamicTotalHeight;

  final List<double> _childWidgetHeights = [];

  final GlobalKey _contentContainerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((_) => _getTotalHeight(_));
  }

  double getWidgetHeight(GlobalKey key) {
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;

    return renderBox.size.height;
  }

  // Get total height of ticker overview for dynamic top app bar calculation
  // void _getTotalHeight(_) {
  //   // Only calculate the height when needed (setHeaderExpandedHeight != null)
  //   if (widget.setHeaderExpandedHeight == null) {
  //     return;
  //   }
  //
  //   _dynamicTotalHeight = 0;
  //
  //   // Get height of the widget with key = _contentContainerKey
  //   _childWidgetHeights.add(getWidgetHeight(_contentContainerKey));
  //
  //   // Calculate the total height (future proof if there are more widgets heights to be added)
  //   for (double height in _childWidgetHeights) {
  //     _dynamicTotalHeight = height + _dynamicTotalHeight!;
  //   }
  //
  //   // Include toolbar height in the calculation
  //   _dynamicTotalHeight = _dynamicTotalHeight! + kToolbarHeight;
  //
  //   // Update the expanded height in the parent widget
  //   widget.setHeaderExpandedHeight!(_dynamicTotalHeight);
  // }

  @override
  Widget build(BuildContext context) {
    // double currentScreenWidth = MediaQuery.of(context).size.width;

    // if (_dynamicTotalHeight == 0) {
    //   return Container();
    // }

    return SafeArea(
      child: Column(
        children: [
          AppBar(),
          Container(
            // Set key so that will be used in the calculation of the expandedHeight
            key: _contentContainerKey,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              // horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 10),
                SectionTabBar(
                  customSectionTabs: widget.customSectionTabs,
                  sectionTabController: widget.sectionTabController,
                  isScrollable: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileTickerHeaderWhenCollapse extends StatelessWidget {
  const MobileTickerHeaderWhenCollapse({
    Key? key,
    required this.sectionTabController,
    this.customSectionTabs,
  }) : super(key: key);
  // final TickerWidgets tickerWidgets;
  final TabController? sectionTabController;
  final List<Tab>? customSectionTabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopAppBar(
          title: '123',
          showHorizontalPadding: true,
        ),
        // overview tabBar
        SectionTabBar(
          customSectionTabs: customSectionTabs,
          sectionTabController: sectionTabController,
          isScrollable: true,
        ),
      ],
    );
  }
}
