import 'package:ecommerce/app/app_urls.dart';
import 'package:network_client/network_client.dart';
import 'package:ecommerce/features/common/data/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final int _perPageDataCount = 30;

  int _currentPage = 0;

  int? _totalPage;

  bool _isInitialLoading = true;

  bool _isLoading = false;

  List<CategoryModel> _categoryList = [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  int? get totalPage => _totalPage;

  List<CategoryModel> get categoryList => _categoryList;

  bool get isLoading => _isLoading;

  bool get isInitialLoading => _isInitialLoading;

  Future<bool> getCategoryList() async {
    if (_totalPage != null && _currentPage > _totalPage!) {
      return true;
    }

    bool isSuccess = false;
    _currentPage++;
    if (!_isInitialLoading) {
      _isLoading = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.categoryListUrl, queryParams: {
      'count': _perPageDataCount,
      'page': _currentPage,
    });
    if (response.isSuccess) {
      List<CategoryModel> list = [];
      for (Map<String, dynamic> data in response.responseData!['data']
          ['results']) {
        list.add(CategoryModel.fromJson(data));
      }
      _categoryList.addAll(list);
      _totalPage = response.responseData!['data']['last_page'];

      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (!_isInitialLoading) {
      _isLoading = false;
    } else {
      _isInitialLoading = false;
    }

    update();

    return isSuccess;
  }

  Future<bool> refreshList() {
    _currentPage = 0;
    _categoryList = [];
    _isInitialLoading = true;
    return getCategoryList();
  }
}
