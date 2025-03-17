import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/presentation/bloc/boarding/boarding_bloc.dart';
import 'package:shop_app/shared/presentation/boarding_screen/widgets/boarding_navigation.dart';
import 'package:shop_app/shared/presentation/boarding_screen/widgets/page_view_body.dart';


class BoardingContent extends StatefulWidget {
  const BoardingContent({super.key});

  @override
  State<BoardingContent> createState() => _BoardingContentState();
}

class _BoardingContentState extends State<BoardingContent> {

  @override
  Widget build(BuildContext context) {
    BoardingBloc boardingBloc=context.read();
    LocalizationBloc localizationBloc=context.read();
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          spacing: 1.h,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                localizationBloc.add(ChangeLanguageEvent());
              },
              child: Container(
                margin: EdgeInsets.only(left: 65.w),
                padding:
                EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.px),
                    border: Border.all(
                        width: 2.px, color: AppColors.mainColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                  children: [
                    CustomText(
                      text: localizationBloc.lang == 'ar'
                          ? 'English'
                          : 'عربي',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    Icon(
                      Icons.language,
                    )
                  ],
                ),
              ),
            ),
            VerticalSpacing(height: 1,),
            PageViewBody(
              controller: boardingBloc.controller,
            ),
            BoardingNavigation(
              controller: boardingBloc.controller,
            ),
          ],
        ),
      ),
    );
  }

}
