import 'package:shop_app/shared/cores/utils/parallel_tool.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: CustomButton(
          onPressed: () {
            navigateTo(context: context, pageName: 'login');
          },
          textSize: 16,
          textColor: AppColors.mainColor,
          borderRadius: 10.w,
          isText: true,
          text: AppLocalizations.of(context)!.skip,
          padding: EdgeInsets.symmetric(horizontal: 7.w,),
          color: Colors.transparent,
          shadowColor: Colors.transparent,
        ));
  }
}
