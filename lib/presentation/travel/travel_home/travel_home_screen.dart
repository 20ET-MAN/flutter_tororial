import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_proj/domain/entity/popular_entity.dart';
import 'package:flutter_demo_proj/presentation/travel/travel_detail/travel_detail_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app_router.gr.dart';
import '../../../domain/entity/travel_category_entity.dart';
import '../../../generated/assets.dart';

@RoutePage()
class TravelHomeScreen extends StatelessWidget {
  TravelHomeScreen({super.key});

  final List<TravelCategoryEntity> listCategory = [
    TravelCategoryEntity(Assets.iconsStart, 'Top 30 places'),
    TravelCategoryEntity(Assets.iconsNature, 'Nature'),
    TravelCategoryEntity(Assets.iconsFood, 'Eating'),
  ];

  final List<PopularEntity> listPopular = [
    PopularEntity(
        'Monument to Salavat Yulaev ', '4,9', true, Assets.imagesSalavatYulaev),
    PopularEntity('Monument to Salavat Yulaev ', '4,9', false,
        Assets.imagesSalavatYulaev),
    PopularEntity(
        'Monument to Salavat Yulaev ', '4,9', true, Assets.imagesSalavatYulaev),
    PopularEntity('Monument to Salavat Yulaev ', '4,9', false,
        Assets.imagesSalavatYulaev),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bashkortostan'),
        titleTextStyle: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w500,
            color: Color(0xFF242424)),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.iconsMap),
              const SizedBox(width: 24)
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: ListView(
          children: [
            const Text(
              'Choose another',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF242424)),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.only(left: 16),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter name or category ",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF242424).withOpacity(0.4),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFF242424).withOpacity(0.3),
                    )),
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 52,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      CategoryItem(travelCategoryEntity: listCategory[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        width: 12,
                      ),
                  itemCount: listCategory.length),
            ),
            const SizedBox(height: 28),
            const Text(
              'Popular',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF242424)),
            ),
            SizedBox(
              height: 280,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => PopularItem(
                        popularEntity: listPopular[index],
                        onClickLike: () {},
                        onTapItem: () {
                          context.router.push(TravelDetailRoute());
                        },
                      ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        width: 12,
                      ),
                  itemCount: listPopular.length),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final TravelCategoryEntity travelCategoryEntity;

  const CategoryItem({super.key, required this.travelCategoryEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            travelCategoryEntity.imagePath,
            width: 36,
            height: 36,
          ),
          const SizedBox(width: 8),
          Text(travelCategoryEntity.label)
        ],
      ),
    );
  }
}

class PopularItem extends StatelessWidget {
  final PopularEntity popularEntity;
  final Function onTapItem;
  final Function onClickLike;

  const PopularItem(
      {super.key,
      required this.popularEntity,
      required this.onTapItem,
      required this.onClickLike});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapItem();
      },
      child: SizedBox(
        width: 212,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Image.asset(popularEntity.imageUrl),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    onClickLike();
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: SvgPicture.asset(
                      Assets.iconsHeath,
                      color: popularEntity.liked
                          ? const Color(0xFFEB5757)
                          : Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    popularEntity.title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFFFD875),
                          size: 13,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          popularEntity.rate,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 28)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
