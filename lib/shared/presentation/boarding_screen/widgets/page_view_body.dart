import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/models/boarding_model.dart';
import 'dart:math' as math;

class PageViewBody extends StatelessWidget {
  const PageViewBody({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double pageOffset = 0;
          if (controller.position.haveDimensions) {
            pageOffset = controller.page! - index - 1;
          }
          double gauss =
              math.exp(-(math.pow((pageOffset.abs() - 0.5), 2) / 0.08));
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 4.h,
            children: [
              Transform.translate(
                offset: Offset(-32 * gauss * pageOffset.sign, 0),
                child: CustomImage(
                  assetPath: arabicBoardingList[index].image,
                  isNetworkImage: false,
                  height: 55.h,
                  width: 93.w,
                  borderRadius: 20.w,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 100.w,
                height: 2.px,
                color: Colors.grey.shade300,
              ),
              CustomText(
                text: AppLocalizations.of(context)!.localeName=='ar'?arabicBoardingList[index].text:englishBoardingList[index].text,
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.center,
                maxLines: 4,
              ),
              Spacer(),
            ],
          );
        },
      ),
      itemCount: arabicBoardingList.length,
      controller: controller,
    ));
  }
}
