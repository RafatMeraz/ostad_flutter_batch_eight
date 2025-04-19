import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network_caller/network_caller.dart';
import 'package:ecommerce/features/common/data/models/slider_model.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _getSlidersInProgress = false;

  List<SliderModel> _sliderList = [];

  String? _errorMessage;

  List<SliderModel> get sliders => _sliderList;

  bool get getSlidersInProgress => _getSlidersInProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _getSlidersInProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: AppUrls.slidersUrl);
    if (response.isSuccess) {
      List<SliderModel> list = [];
      for (Map<String, dynamic> data
          in response.responseData?['data']['results'] ?? []) {
        list.add(SliderModel.fromJson(data));
      }
      _sliderList = list;
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getSlidersInProgress = false;
    update();
    return isSuccess;
  }
}
