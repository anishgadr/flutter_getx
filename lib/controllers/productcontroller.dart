import 'package:flutter_getx/models/product.dart';
import 'package:flutter_getx/services/remote_services.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var productlist = List<Product>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchproduct();
    super.onInit();
  }

  void fetchproduct() async {
    try {
      isLoading(true);
      var product = await RemoteServices.fetchProducts();
      if (product != null) {
        productlist.assignAll(product);
      }
    } finally {
      isLoading(false);
    }
  }
}
