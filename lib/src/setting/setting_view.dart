import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/setting/setting_content.dart';


class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const SettingContent()),
    );
  }
}
