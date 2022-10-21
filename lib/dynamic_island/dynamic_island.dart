import 'package:flutter/material.dart';

import 'island_type.dart';

class DynamicIsland extends StatefulWidget {
  const DynamicIsland({Key? key}) : super(key: key);

  @override
  State<DynamicIsland> createState() => _DynamicIslandState();
}

class _DynamicIslandState extends State<DynamicIsland> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PageContainer(),
    );
  }
}

class PageContainer extends StatefulWidget {
  const PageContainer({Key? key}) : super(key: key);

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  int activePageIndex = 0;
  bool shrinked = true;
  final List<Island> islands = [
    const Island(
        shrinkedIsland: CallShrinked(islandType: IslandType.phoneCall,),
        expandedIsland: CallExpanded(islandType: IslandType.phoneCall,),
        expandedHeight: 60,
        expandedBorderRadius: 40),
    const Island(
        shrinkedIsland: CallShrinked(islandType: IslandType.music,),
        expandedIsland: CallExpanded(islandType: IslandType.music,),
        expandedHeight: 60,
        expandedBorderRadius: 40),
    const Island(
        shrinkedIsland: CallShrinked(islandType: IslandType.map,),
        expandedIsland: CallExpanded(islandType: IslandType.map,),
        expandedHeight: 60,
        expandedBorderRadius: 40),
  ];

  void setActivePageIndex(int index) {
    setState(() {
      activePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeIsland = islands[activePageIndex];
    final PageController pageController = PageController();
    final islandToBeShown =
        shrinked ? activeIsland.shrinkedIsland : activeIsland.expandedIsland;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreenAccent,
              Colors.lightGreen,
              Colors.green,
            ],
          )),
          child: PageView(
            controller: pageController,
            onPageChanged: setActivePageIndex,
            children: const [
              Center(
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              setState(() {
                shrinked = !shrinked;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width * (shrinked ? 0.4 : 0.8),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(
                      shrinked ? 25.0 : activeIsland.expandedBorderRadius)),
              height: shrinked ? 35 : 60,
              curve: Curves.easeOut,
              child: islandToBeShown,
            ),
          ),
        )
      ],
    );
  }
}

class Island {
  const Island({
    required this.expandedHeight,
    required this.expandedBorderRadius,
    required this.shrinkedIsland,
    required this.expandedIsland,
  });

  final Widget shrinkedIsland;
  final Widget expandedIsland;
  final double expandedHeight;
  final double expandedBorderRadius;
}

class CallShrinked extends StatelessWidget {
  const CallShrinked({Key? key, required this.islandType}) : super(key: key);
  final IslandType islandType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Row(
            children:  [
              Icon(
                islandTypeShrinkedIconData[islandType],
                color: Colors.greenAccent,
                size: 16,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '0:00',
                style: TextStyle(color: Colors.greenAccent),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.waves,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    );
  }
}

class CallExpanded extends StatelessWidget {
  const CallExpanded({Key? key, required this.islandType}) : super(key: key);
  final IslandType islandType;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children:  [
                Icon(
                  islandTypeShrinkedIconData[islandType],
                  color: Colors.greenAccent,
                  size: 30,
                ),
              ],
            ),
            Text(
              'call',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 30,
              ),
            ),
          ],
        ));
  }
}
