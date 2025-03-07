import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/bloc/auth/auth_bloc.dart';
import 'package:shop_app/src/setting/setting_content.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 4.h,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider(
              create: (BuildContext context) => AuthBloc(),
        child: SettingContent(),
             ),
    );
  }
}
