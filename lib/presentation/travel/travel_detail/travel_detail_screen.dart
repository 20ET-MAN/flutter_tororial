import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_proj/generated/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/entity/detail_category_entity.dart';

@RoutePage()
class TravelDetailScreen extends StatelessWidget {
  TravelDetailScreen({super.key});

  final List<DetailCategoryEntity> listCategory = [
    DetailCategoryEntity(Assets.iconsPrice, 'from 90'),
    DetailCategoryEntity(Assets.iconsDistance, '6 часа'),
    DetailCategoryEntity(Assets.iconsBreakfast, 'Full Board'),
    DetailCategoryEntity(Assets.iconsEnsurance, 'Insurance '),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    margin: const EdgeInsets.only(left: 24, top: 12, bottom: 12),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF8F8F8)),
                    child: SvgPicture.asset(
                      Assets.iconsVector,
                      width: 14,
                      height: 7,
                    ),
                  ),
                ),
                expandedHeight: 397,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesImageAppbar,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 170,
                                height: 44,
                                margin: const EdgeInsets.only(left: 24, bottom: 24),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF5D5252).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      child: ClipOval(
                                        child: Image.asset(
                                          Assets.imagesSalavatYulaev,
                                          fit: BoxFit.fill,
                                          width: 36,
                                          height: 36,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Column(
                                      children: [
                                        Text(
                                          'Azat Khabirov ',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Location guide',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20)
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18)
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.iconsHeath,
                                    width: 18,
                                    height: 16,
                                  ),
                                ),
                                const SizedBox(width: 20)
                              ],
                            ),
                            const SizedBox(height: 10)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView(
                  children: [
                    const Text(
                      'Shulgaт-Tash cae ',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                    ),
                    const Text(
                      'A truly amazing example of the creation of nature, the Kapova cave with cave paintings of ancient people with...',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          'Read more',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFFFF678B)),
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          Assets.iconsMore,
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 92,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int i) =>
                              DetailCategoryItem(
                                detailCategoryEntity: listCategory[i],
                              ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 12),
                          itemCount: listCategory.length),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xFFFF678B)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Buy a tour ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 12),
            SvgPicture.asset(
              Assets.iconsArrow,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class DetailCategoryItem extends StatelessWidget {
  const DetailCategoryItem({super.key, required this.detailCategoryEntity});

  final DetailCategoryEntity detailCategoryEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF8F8F8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(detailCategoryEntity.iconData),
          const SizedBox(height: 12),
          Text(
            detailCategoryEntity.label,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFf222222)),
          ),
        ],
      ),
    );
  }
}
