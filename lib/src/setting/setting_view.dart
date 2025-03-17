import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/bloc/auth/auth_bloc.dart';
import 'package:shop_app/src/bloc/home/home_bloc.dart';
import 'package:shop_app/src/setting/setting_content.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    String uid=ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 4.h,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: CustomText(text: 'Settings',fontWeight: FontWeight.w800,fontSize: 20,),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => HomeBloc()..add(GetDataEvent(uid: uid)),
            lazy: false,
          ),
        ],
        child: BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state is LogOutSuccessfully){
      navigateWithOutBack(context: context, pageName: 'login', canBack: false);
    }
  },
  child: SettingContent(),
),
      ),
    );
  }
}
