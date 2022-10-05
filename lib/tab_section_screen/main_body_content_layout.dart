import 'package:flutter/material.dart';
import 'package:xuhui_widget/constant/view_width.dart';
import 'package:xuhui_widget/tab_section_screen/center_container.dart';
import 'package:xuhui_widget/tab_section_screen/main_body_content.dart';

// used to be named ResponsiveContainer

class MainBodyContentLayout extends StatefulWidget {
  const MainBodyContentLayout({
    Key? key,
    this.centerContainerContent,
    this.rightSideContainerContent,
    this.topContainerContent,
    this.showLeftSideContainer = true,
    // this.showTopHideableWidget = false,
    this.changeCurrentIndex,
  }) : super(key: key);

  final Widget? centerContainerContent;
  final Widget? rightSideContainerContent;
  final Widget? topContainerContent;
  final bool showLeftSideContainer;
  // final showTopHideableWidget;
  final Function? changeCurrentIndex;

  @override
  _MainBodyContentLayoutState createState() => _MainBodyContentLayoutState();
}

class _MainBodyContentLayoutState extends State<MainBodyContentLayout> {
  //// Scrollable Hideable Widget

  // 20210602 - Deprecated until desktop is worked on
  /*
  // Height of your Container
  static final double _scrollingContainerHeight = 100.0;

  // You don't need to change any of these variables
  var _fromTop = -_scrollingContainerHeight;
  var _controller = ScrollController();
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_scrollingContainerHeight;
  var _prevReverseOffset = 0.0;
   */

  double containerOpacity = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   // if (widget.showTopHideableWidget) {
  //   //   _controller.addListener(_listener);
  //   // }
  // }

  // 20210602 - Deprecated until desktop is worked on
  /*
  // entire logic is inside this listener for ListView
  void _listener() {
    double offset = _controller.offset;
    // print(offset);
    var direction = _controller.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;
      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;
      if (_allowForward) {
        _allowForward = false;
        _prevOffset = offset;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevReverseOffset + difference;
      if (_fromTop < -_scrollingContainerHeight)
        _fromTop = -_scrollingContainerHeight;
    }

    setState(() {
      containerOpacity = 0;
      // Show only after offset reaches past 101 height
      var thresholdHeightToStick = 200;
      if (offset > thresholdHeightToStick) {
        // Keeps the nav bar sticking to top
        containerOpacity = 1;
        _fromTop = 0;
      } else if (offset > 100) {
        containerOpacity = 1 - (-_fromTop / _scrollingContainerHeight);
      }
    }); // for simplicity I'm calling setState here, you can put bool values to only call setState when there is a genuine change in _fromTop
  }
  */
  //// Scrollable Hideable Widget

  @override
  Widget build(BuildContext context) {
    double _deviceWidth;
    // 20210602 - Deprecated until desktop is worked on
    /*
    double _mainContainerWidth;
    */

    // // For notification scroll
    // double HEIGHT = 358;
    // final ValueNotifier<double> notifier = ValueNotifier(0);

    // Identify viewport type based on device width
    _deviceWidth = MediaQuery.of(context).size.width;
    bool _isDesktopWidth = _deviceWidth > ViewWidth.minDesktop;
    bool _isTabletWidth = _deviceWidth >= ViewWidth.maxTablet &&
        _deviceWidth < ViewWidth.minDesktop;
    bool _isNotMobileWidth = _deviceWidth > ViewWidth.maxMobile;

    // 20210602 - Deprecated until desktop is worked on
    /*
    double _deviceHeight = MediaQuery.of(context).size.height;

    double _containerHeight = _deviceHeight - kCustomTopAppNavBarHeight;

    // Set main container width according to size of viewport
    if (_isDesktopWidth) {
      // Desktop viewport
      _mainContainerWidth = ViewWidth.minDesktop;
    } else if (_isTabletWidth) {
      // Tablet viewport
      _mainContainerWidth = ViewWidth.maxTablet;
    } else {
      // Mobile viewport
      _mainContainerWidth = double.infinity;
      _containerHeight -= kBottomBarHeight;
    }

    // In between mobile and tablet
    if (_deviceWidth < ViewWidth.maxTablet &&
        _deviceWidth > ViewWidth.maxMobile) {
      _containerHeight += kBottomBarHeight;
    }
    */

    return Column(
      children: [
        // MainBodyContentContainer(
        //   children: <Widget>[
        //     MainBodyContentTopContainer(
        //       isNotMobileWidth: _isNotMobileWidth,
        //       isTabletWidth: _isTabletWidth,
        //       deviceWidth: _deviceWidth,
        //       topContainerContent: widget.topContainerContent,
        //     ),
        //   ],
        // ),
        MainBodyContentContainer(
          children: <Widget>[
            // LeftSideContainer(
            //   isDesktopWidth: _isDesktopWidth,
            //   showLeftSideContainer: showLeftSideContainer,
            //   changeCurrentIndex: changeCurrentIndex,
            // ),
            CenterContainer(
              isNotMobileWidth: _isNotMobileWidth,
              isTabletWidth: _isTabletWidth,
              deviceWidth: _deviceWidth,
              centerContainerContent: widget.centerContainerContent!,
            ),
            // RightSideContainer(
            //   isDesktopWidth: _isDesktopWidth,
            //   isTabletWidth: _isTabletWidth,
            //   rightSideContainerContent: widget.rightSideContainerContent,
            // ),
          ],
        ),
      ],
    );
  }

// 20210602 - Deprecated until desktop is worked on
/*
  Widget _yourContainer() {
    return Opacity(
      opacity: containerOpacity,
      child: Container(
        height: _scrollingContainerHeight,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text("Your Container",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: CustomColour.white)),
      ),
    );
  }
  */
}
