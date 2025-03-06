import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/models/boarding_model.dart';
import 'package:shop_app/shared/presentation/bloc/boarding/boarding_bloc.dart';
import 'package:shop_app/shared/presentation/boarding_screen/widgets/skip_button.dart';

class BoardingNavigation extends StatelessWidget {
  const BoardingNavigation({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    BoardingBloc bloc = context.read();
    BoardingBloc blocListener = context.watch();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 5.w,
      children: [
        blocListener.pageNum > 0
            ? CustomButton(
                onPressed: () {
                  bloc.add(PreviousBoardingPageEvent());
                },
                borderRadius: 10.w,
                color: AppColors.blackColor,
                textSize: 14,
                elevation: 3.px,
                isText: false,
                icon: Icons.arrow_back,
              )
            : SkipButton(),
        SmoothPageIndicator(
          controller: controller,
          count: boardingList.length,
          axisDirection: Axis.horizontal,
          effect: ScrollingDotsEffect(
            spacing: 12.px,
            radius: 10.px,
            dotWidth: 10.px,
            dotHeight: 10.px,
            dotColor: Colors.grey.shade300,
            activeDotColor: AppColors.mainColor,
          ),
        ),
        blocListener.pageNum == 2
            ? CustomButton(
                onPressed: () {
                  bloc.controller.dispose();
                  navigateWithOutBack(
                      context: context, pageName: 'login', canBack: false);
                },
                borderRadius: 10.w,
                color: AppColors.blackColor,
                textSize: 16,
                elevation: 3.px,
          isText: true,
                text: 'Get Started',
              )
            : CustomButton(
                onPressed: () {
                  bloc.add(NextBoardingPageEvent());
                },
                borderRadius: 10.w,
                color: AppColors.blackColor,
                textSize: 14,
                elevation: 3.px,
                isText: false,
                icon: Icons.arrow_forward,
              )
      ],
    );
  }
}
