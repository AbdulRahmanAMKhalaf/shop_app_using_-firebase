import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/bloc/auth/auth_bloc.dart';
import 'package:shop_app/src/home_screen/home_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 8.h,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 7, bottom: 7),
          child: CustomImage(
            isNetworkImage: false,
            assetPath: AppImages.profileImage,
            borderRadius: 30,
          ),
        ),
        title: CustomText(
          text: 'Hello,\nAbdulRahman Ayman',
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
        backgroundColor: Colors.deepOrange.shade100.withValues(alpha: 0.3),
        shadowColor: Colors.deepOrange,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.card_travel,
                size: 25,
              )),
          HorizontalSpacing(
            width: 1,
          ),
          IconButton(
              onPressed: () {
                navigateWithOutBack(
                    context: context, pageName: 'settings', canBack: true);
              },
              icon: Icon(
                Icons.settings,
                size: 25,
              ))
        ],
      ),
      body: HomeContent(),
    );
  }
}
