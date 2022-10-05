import 'package:flutter/material.dart';

enum SectionScreenTab {
  Xuhui,
  Wangkehong,
  Wangxincen,
  Xuhao,
}

final Map<int, SectionScreenTab> sectionScreenTabIndexDictionary = {
  0: SectionScreenTab.Xuhui,
  1: SectionScreenTab.Wangkehong,
  2: SectionScreenTab.Wangxincen,
  3: SectionScreenTab.Xuhao,
};

final Map<String, SectionScreenTab> sectionScreenTabStringIndexDictionary = {
  'Xuhui': SectionScreenTab.Xuhui,
  'Wangkehong': SectionScreenTab.Wangkehong,
  'Wangxincen': SectionScreenTab.Wangxincen,
  'Xuhao': SectionScreenTab.Xuhao,
};

final List<String> sectionTabStrings = <String>[
  'Xuhui',
  'Wangkehong',
  'Wangxincen',
  'Xuhao'
];

class SectionTabBar extends StatelessWidget {
  const SectionTabBar({
    Key? key,
    required this.sectionTabController,
    this.labelPadding,
    this.isScrollable,
    this.customSectionTabs,
  }) : super(key: key);

  final TabController? sectionTabController;
  final EdgeInsetsGeometry? labelPadding;
  final bool? isScrollable;

  final List<Tab>? customSectionTabs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: customSectionTabs!.length,
      child: TabBar(
          isScrollable: isScrollable!,
          unselectedLabelColor: Colors.grey,
          labelColor: Theme.of(context).primaryColor,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorPadding: const EdgeInsets.only(bottom: 0),
          labelPadding: labelPadding,
          controller: sectionTabController,
          tabs: customSectionTabs!),
    );
  }
}
