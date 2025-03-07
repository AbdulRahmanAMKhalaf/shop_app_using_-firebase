import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/bloc/home/home_bloc.dart';
import 'package:shop_app/src/home_screen/home_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    String uid=ModalRoute.of(context)?.settings.arguments as String;
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetDataEvent(uid: uid)),
      lazy: false,
      child: Scaffold(
        body: SafeArea(child: HomeContent()),
      ),
    );
  }
}
