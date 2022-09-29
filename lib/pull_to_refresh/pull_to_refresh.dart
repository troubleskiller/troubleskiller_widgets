import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum EnumCustomPullToRefreshPlatformType {
  IOS,
  ANDROID,
}

class PullDownToRefresh {
  /// Trigger an haptic feedback (light vibration) when pull down to refresh
  /// * Only for iOS
  void TriggerHapticFeedback() {
    if (Platform.isIOS) {
      HapticFeedback.lightImpact();
    }
  }
}

/// Custom loading spinner for refreshing
/// * IOS - dottedCircle, on the standard gradient background behind the cards
/// * Android - Material design and overlaying the screen
class CustomPullToRefreshWidget extends StatelessWidget {
  const CustomPullToRefreshWidget({
    Key? key,
    required this.platformType,
  }) : super(key: key);

  final EnumCustomPullToRefreshPlatformType platformType;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS &&
        platformType == EnumCustomPullToRefreshPlatformType.IOS) {
      return const IOSPullToRefreshWidget();
    } else if (Platform.isAndroid &&
        platformType == EnumCustomPullToRefreshPlatformType.ANDROID) {
      return const AndroidPullToRefreshWidget();
    } else {
      return const SizedBox.shrink();
    }
  }
}

/// Custom loading spinner for refreshing for IOS
class IOSPullToRefreshWidget extends StatelessWidget {
  const IOSPullToRefreshWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: PullToRefreshSpinnerWidget(),
    );
  }
}

/// Custom loading spinner for refreshing for Android - Material design and should be overlaying the screen
class AndroidPullToRefreshWidget extends StatelessWidget {
  const AndroidPullToRefreshWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(2, 2),
          ),
        ],
      ),
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 80,
      ),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).backgroundColor,
        child: PullToRefreshSpinnerWidget(
          spinnerColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

/// Common Spinner widget for pull down to refresh
/// In use in:
/// * IOSPullToRefreshWidget
/// * AndroidPullToRefreshWidget
class PullToRefreshSpinnerWidget extends StatelessWidget {
  const PullToRefreshSpinnerWidget({
    Key? key,
    this.spinnerColor,
  }) : super(key: key);

  /// If spinnerColor is null, it will fall back to default colour.
  final Color? spinnerColor;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/icons/common/loading.grey.gif',
      color: spinnerColor,
      width: 20,
      height: 20,
    );
  }
}
