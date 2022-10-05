import 'package:flutter/material.dart';
import 'package:xuhui_widget/pull_to_refresh/debouncer.dart';

class PullToRefreshWidget extends StatefulWidget {
  const PullToRefreshWidget({Key? key}) : super(key: key);

  @override
  State<PullToRefreshWidget> createState() => _PullToRefreshWidgetState();
}

class _PullToRefreshWidgetState extends State<PullToRefreshWidget> {
  // Flag for drag down to refresh
  bool _isRefreshing = false;
  Debouncer? _debouncer;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initScrollController();
  }

  void initScrollController() {
    _debouncer = Debouncer();
    _scrollController.addListener(() {
      double userScroll = _scrollController.position.pixels;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      setState(() {
        _isRefreshing = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
