import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:real_estate_price_prediction/home/model/locations_model.dart';

class HomeController extends GetxController{
  RxBool loading = true.obs;
  RxBool gettingPrice = false.obs;
  RxString currentLocation = "".obs;
  Dio dio = Dio();
  String get_locations_url = 'http://127.0.0.1:5000/get_location_names';
  String get_price_url = 'http://127.0.0.1:5000/predict_home_price';
  RxList<String> locations = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getLocations() async {
    var response = await dio.get(get_locations_url);

    if(response.statusCode == 200){
      locations.value = LocationsModel.fromJson(response.data).locations ?? [];
      if(locations.isNotEmpty){
        currentLocation.value = locations[0];
      }
    }

    loading.value = false;
  }

  Future<num> getPrice(int totalSqft, String location, int bhk, int bath) async {

    gettingPrice.value = true;
    num price = -1;

    var response = await dio.post(get_price_url,data: {
      'total_sqft': totalSqft,
      'location': location,
      'bhk': bhk,
      'bath': bath
    });
    print("RESPONSE_DATA: ${response.data}");

    if(response.statusCode == 200){
      price = response.data;
      print("RESPONSE_DATA: ${response.data}");
    }

    gettingPrice.value = false;

    return price;
  }

}