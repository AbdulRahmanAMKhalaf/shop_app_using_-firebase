import 'package:flutter_animate/flutter_animate.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/models/categories_model.dart';
import 'package:shop_app/shared/models/products_model.dart';
import 'package:shop_app/src/bloc/auth/auth_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc blocListener = context.watch();
    return blocListener.getData!.docs.isEmpty
        ? Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
        : ListView(
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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.w,
                    mainAxisSpacing: 4.w),
                itemBuilder: (context, index) {
                  List<ProductModel> sendingList = [];
                  return InkWell(
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.transparent,
                    onTap: () {
                      if (index == 0) {
                        sendingList = groceriesList;
                      } else if (index == 1) {
                        sendingList = electronicsList;
                      } else if (index == 2) {
                        sendingList = clothesList;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: CustomText(
                              text: 'Coming Soon !',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            duration: 2.seconds,
                            showCloseIcon: true,
                            backgroundColor: AppColors.mainColor,
                          ),
                        );
                      }
                      navigateWithOutBack(
                          context: context,
                          pageName: 'details',
                          canBack: true,
                          arguments: sendingList);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.shade200),
                      padding: EdgeInsets.all(3.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 2.h,
                        children: [
                          CustomImage(
                            isNetworkImage: false,
                            assetPath: categoriesList[index].image,
                          ),
                          CustomText(
                            text: categoriesList[index].name,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          )
                        ],
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
