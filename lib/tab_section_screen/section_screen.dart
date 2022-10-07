import 'package:flutter/material.dart';
import 'package:xuhui_widget/tab_section_screen/hideableWidget.dart';
import 'package:xuhui_widget/tab_section_screen/main_body_content_layout.dart';
import 'package:xuhui_widget/tab_section_screen/section_tab_bar.dart';
import 'package:xuhui_widget/tab_section_screen/tab_bar/tab_bar.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({Key? key}) : super(key: key);

  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  TabController? sectionTabController;

  dynamic parsedTabIndexDictionary = {
    0: SectionScreenTab.Xuhui,
    1: SectionScreenTab.Wangkehong,
    2: SectionScreenTab.Wangxincen,
    3: SectionScreenTab.Xuhao,
  };

  List<Tab> displayedTabs = [
    Tab(
      text: 'Xuhui',
    ),
    Tab(
      text: 'Wangkehong',
    ),
    Tab(
      text: 'Wangxincen',
    ),
    Tab(
      text: 'Xuhao',
    ),
  ];

  ///当前选中的页面的index
  int selectSectionTabIndex = 0;

  SectionScreenTab currentTab = SectionScreenTab.Xuhui;

  ///中间的滚动部分
  Widget? _centerContainerContent;

  void setupTabController() {
    sectionTabController = TabController(length: 4, vsync: this);
    sectionTabController!.addListener(() {
      print(sectionTabController!.index);
      setState(() {
        setTabBarIndex(sectionTabController!.index);
      });
    });
  }

  void setTabBarIndex([int tabBarIndex = 0]) {
    var newTab = parsedTabIndexDictionary[tabBarIndex];

    ///不做任何改变，如果新的Tab和当前Tab一样
    if (currentTab == newTab) {
      return;
    }

    currentTab = newTab ?? SectionScreenTab.Xuhui;

    switch (currentTab) {
      case SectionScreenTab.Xuhui:
        _centerContainerContent = Container(
            height: 2000,
            color: Colors.green,
            child: Center(
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: MaterialButton(
                  onPressed: () {
                    print('press012');
                    setTabBarIndex(1);
                  },
                ),
              ),
            ));
        break;
      case SectionScreenTab.Wangkehong:
        _centerContainerContent = Container(
            height: 2000,
            color: Colors.red,
            child: Center(
              child: Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: MaterialButton(
                  onPressed: () {
                    print('press123');
                    setTabBarIndex(2);
                  },
                ),
              ),
            ));
        break;
      case SectionScreenTab.Wangxincen:
        _centerContainerContent = Container(
            height: 2000,
            color: Colors.blue,
            child: Center(
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: MaterialButton(
                  onPressed: () {
                    print('press234');
                    setTabBarIndex(3);
                  },
                ),
              ),
            ));
        break;
      case SectionScreenTab.Xuhao:
        _centerContainerContent = Container(
            height: 2000,
            color: Colors.yellow,
            child: Center(
              child: Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: MaterialButton(
                  onPressed: () {
                    print('press345');
                    setTabBarIndex(0);
                  },
                ),
              ),
            ));
        break;
    }
    setState(() {
      selectSectionTabIndex = tabBarIndex;

      if (sectionTabController != null) {
        sectionTabController!.index = tabBarIndex;
      }
    });
    scrollController.jumpTo(450);
  }

  @override
  void initState() {
    super.initState();
    setupTabController();
    scrollController.addListener(() {
      print(scrollController.offset);
    });

    _centerContainerContent = Container(
        height: 2000,
        color: Colors.green,
        child: Center(
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
            child: MaterialButton(
              onPressed: () {
                setTabBarIndex(1);
              },
            ),
          ),
        ));
    setTabBarIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            forceElevated: true,
            toolbarHeight: 105,
            elevation: 3,
            automaticallyImplyLeading: false,
            pinned: true,
            primary: true,
            titleSpacing: 0,
            title: HideableWidget(
              child: MobileTickerHeaderWhenCollapse(
                sectionTabController: sectionTabController,
                customSectionTabs: displayedTabs,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: MobileTickerHeader(
                sectionTabController: sectionTabController,
                customSectionTabs: displayedTabs,
                setHeaderExpandedHeight: () {},
                setSectionTabBarIndex: (int index) {
                  setTabBarIndex(index);
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  MainBodyContentLayout(
                    centerContainerContent: _centerContainerContent,
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
