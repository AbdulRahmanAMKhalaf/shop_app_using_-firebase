import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/models/products_model.dart';
import 'package:shop_app/src/home_screen/widgets/home_categories.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(3.w),
      children: [
        VerticalSpacing(
          height: 1,
        ),
        CustomTextFormField(
          labelText: 'Search',
          hintText: 'search about what you need',
          keyboardType: TextInputType.text,
          prefixIcon: Icon(
            Icons.search,
            size: 25.px,
            color: AppColors.mainColor,
          ),
        ),
        VerticalSpacing(
          height: 2,
        ),
      
        CustomText(
          text: 'Categories',
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        VerticalSpacing(
          height: 2,
        ),
        HomeCategoriesList(),
        VerticalSpacing(
          height: 2,
        ),
        CustomText(
          text: 'The Best Selling',
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        VerticalSpacing(
          height: 2,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: productsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 4.w, mainAxisSpacing: 4.w),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                navigateWithOutBack(
                    context: context,
                    pageName: 'details',
                    canBack: true,
                    arguments: index);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.shade200),
                padding: EdgeInsets.all(10.w),
                child: Hero(
                  tag: 'images$index',
                  child: CustomImage(
                    isNetworkImage: false,
                    assetPath: productsList[index].image,
                  ),
                ),
              ),
            );
          },
        ),
        VerticalSpacing(
          height: 2,
        ),
      ],
    );
  }
}
