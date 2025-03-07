import 'package:shop_app/shared/models/products_model.dart';
import 'package:shop_app/src/details_screen/details_content.dart';

import '../../shared/cores/utils/parallel_tool.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ProductModel> list =
        ModalRoute.of(context)?.settings.arguments as List<ProductModel>;
    return Scaffold(
      appBar: AppBar(),
      body: DetailsContent(
              list: list,
            ),
    );
  }
}
