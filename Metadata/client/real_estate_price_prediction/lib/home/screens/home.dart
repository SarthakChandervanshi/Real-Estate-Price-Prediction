import 'package:flutter/material.dart';
import 'package:real_estate_price_prediction/home/controller/home_controller.dart';
import 'package:real_estate_price_prediction/reusable_components/custom_textfield.dart';
import 'package:get/get.dart';

import 'sub_screens/location_dropdown.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _totalAreaInSqFt = TextEditingController();

  final TextEditingController _noOfBathrooms = TextEditingController();

  final TextEditingController _bhk = TextEditingController();

  final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _homeController.getLocations();
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(_homeController.loading.value == false){
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Enter the following details",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),),
                    const SizedBox(height: 32,),
                    CustomTextField(
                      textEditingController: _totalAreaInSqFt,
                      hintText: "Total Area (in sqft)",
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 16,),
                    CustomTextField(
                      textEditingController: _noOfBathrooms,
                      hintText: "Bathrooms",
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 16,),
                    CustomTextField(
                      textEditingController: _bhk,
                      hintText: "BHK",
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 16,),
                    const LocationDropDown(),
                    const SizedBox(height: 32,),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8)
                      ),
                      onPressed: () {
                        _homeController.getPrice(int.parse(_totalAreaInSqFt.text), _homeController.currentLocation.value, int.parse(_bhk.text), int.parse(_noOfBathrooms.text));
                      },
                      child: _homeController.gettingPrice.value ? const CircularProgressIndicator(color: Colors.white,) : const Text("Get Price",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
      else{
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
          ),
        );
      }
    });
  }
}
