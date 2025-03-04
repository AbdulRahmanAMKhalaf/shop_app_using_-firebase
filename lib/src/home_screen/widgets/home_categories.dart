import 'package:shop_app/shared/models/categories_model.dart';

import '../../../shared/cores/utils/parallel_tool.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              child: Column(
                spacing: 1.h,
                children: [
                  CustomImage(
                    borderRadius: 30.px,
                    isNetworkImage: false,
                    height: 5.h,
                    width: 10.w,
                    assetPath: categoriesList[index].image,
                  ),
                  CustomText(
                    text: categoriesList[index].name,
                    fontSize: 13,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  Container(
                    color: AppColors.mainColor,
                    width: 15.px,
                    height: 2.px,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => HorizontalSpacing(
                width: 2.5.w,
              ),
          itemCount: categoriesList.length),
    );
  }
}
