import 'package:intl/intl.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/home_screen/home_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          appBar: CustomAppBar(
            textColor: Colors.black,
            fontWeight: FontWeight.w800,
            title:
                'Hello,AbdulRahman Ayman\n${DateFormat('d-MMM-yyy').format(DateTime.now())}',
            size: 16,
            lines: 3,
            backgroundColor: Colors.grey.shade100,
          ),
          body: HomeContent(),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
         padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20.px),
            border: Border.all(color: AppColors.mainColor, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home_outlined,
                  size: 30.px,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30.px,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.local_offer_outlined,
                  size: 30.px,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 30.px,
                  color: Colors.black,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
