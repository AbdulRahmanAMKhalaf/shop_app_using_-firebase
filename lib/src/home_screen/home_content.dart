import 'package:flutter_animate/flutter_animate.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/models/categories_model.dart';
import 'package:shop_app/shared/models/products_model.dart';
import 'package:shop_app/src/bloc/home/home_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc blocListener = context.watch();
    return blocListener.state is GeTDataLoading
        ? Center(
            child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ))
        : ListView(
            padding: EdgeInsets.all(3.w),
            children: [
              Row(
                children: [
                  CustomText(
                    text:
                        '${AppLocalizations.of(context)!.hello},\n${blocListener.userModel?.name}',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        navigateWithOutBack(
                            context: context,
                            pageName: 'settings',
                            canBack: true,
                            arguments: blocListener.uid);
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Colors.black,
                        size: 25,
                      ))
                ],
              ),
              VerticalSpacing(
                height: 2,
              ),
              CustomTextFormField(
                labelText: AppLocalizations.of(context)!.search,
                hintText: AppLocalizations.of(context)!.searchAbout,
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
                text: AppLocalizations.of(context)!.categories,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              VerticalSpacing(
                height: 2,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: arabicCategoriesList.length,
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
                        sendingList =
                            AppLocalizations.of(context)!.localeName == 'ar'
                                ? arabicGroceriesList
                                : englishGroceriesList;
                      } else if (index == 1) {
                        sendingList =
                            AppLocalizations.of(context)!.localeName == 'ar'
                                ? arabicElectronicsList
                                : englishElectronicsList;
                      } else if (index == 2) {
                        sendingList =
                            AppLocalizations.of(context)!.localeName == 'ar'
                                ? arabicClothesList
                                : englishClothesList;
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
                            assetPath: arabicCategoriesList[index].image,
                          ),
                          CustomText(
                            text: AppLocalizations.of(context)!.localeName=='ar'?arabicCategoriesList[index].name:englishCategoriesList[index].name,
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
