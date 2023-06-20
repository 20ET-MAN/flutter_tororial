import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_proj/app_router.gr.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';

@RoutePage()
class TravelBottomNavigationBar extends StatelessWidget {
  TravelBottomNavigationBar({super.key});

  final List<PageRouteInfo> sp = [
    TravelHomeRoute(),
    const TravelLikeRoute(),
    const TravelMessageRoute(),
    const TravelSettingRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: sp,
      transitionBuilder: (context, child, animation) =>
          FadeTransition(
            opacity: animation,
            // the passed child is technically our animated selected-tab page
            child: child,
          ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: child,
          bottomNavigationBar: Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationBarItem(
                  isSelected: tabsRouter.activeIndex ==0 ,
                  onItemClick: () {
                    tabsRouter.setActiveIndex(0);
                  },
                  assetIcon: Assets.iconsMain,
                ),
                BottomNavigationBarItem(
                  isSelected: tabsRouter.activeIndex == 1,
                  onItemClick: () {
                    tabsRouter.setActiveIndex(1);
                  },
                  assetIcon: Assets.iconsLiked,
                ),
                BottomNavigationBarItem(
                  isSelected: tabsRouter.activeIndex == 2,
                  onItemClick: () {
                    tabsRouter.setActiveIndex(2);
                  },
                  assetIcon: Assets.iconsChat,
                ),
                BottomNavigationBarItem(
                  isSelected: tabsRouter.activeIndex == 3,
                  onItemClick: () {
                    tabsRouter.setActiveIndex(3);
                  },
                  assetIcon: Assets.iconsSettings,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BottomNavigationBarItem extends StatelessWidget {
  const BottomNavigationBarItem({super.key,
    required this.isSelected,
    required this.onItemClick,
    required this.assetIcon});

  final String assetIcon;
  final bool isSelected;
  final Function onItemClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: isSelected ? const Color(0xFFEB5757) : Colors.transparent,
      ),
      child: IconButton(
        enableFeedback: false,
        onPressed: () {
          onItemClick();
        },
        icon: SvgPicture.asset(
          assetIcon,
          color: isSelected ? Colors.white : const Color(0xFF414141),
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
