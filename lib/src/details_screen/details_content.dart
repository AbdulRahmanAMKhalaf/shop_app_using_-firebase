import 'package:shop_app/shared/models/products_model.dart';

import '../../shared/cores/utils/parallel_tool.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({super.key, required this.list});

  final List<ProductModel> list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty?Center(child: CustomText(text: 'No Items',fontWeight: FontWeight.w800,fontSize: 20,)):ListView.custom(
        padding: EdgeInsets.all(3.w),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: list.length,
          (context, index) {
            return Container(
              padding: EdgeInsets.all(2.w),
              margin: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: AppColors.mainColor.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 2.w,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)),
                    child: CustomImage(
                      isNetworkImage: false,
                      assetPath: list[index].image,
                      height: 8.h,
                      width: 18.w,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 0.5.h,
                    children: [
                      CustomText(
                        text: list[index].name,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        maxLines: 2,
                      ),
                      CustomText(
                        text: '${list[index].price} J.D',
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        maxLines: 2,
                      ),
                      CustomText(
                        text: list[index].weight==null?'':'${list[index].weight} K.g',
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 0.5.h,
                    children: [
                      Row(
                        spacing: 1.w,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove),
                            color: AppColors.mainColor,
                          ),
                          CustomText(
                            text: '1',
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border),color: Colors.black
                        ,)
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
